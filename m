Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6964E3E3F89
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 08:09:21 +0200 (CEST)
Received: from localhost ([::1]:57458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCyTQ-00011R-1N
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 02:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mCySW-0000Kj-S1
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 02:08:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mCySP-0000qG-UJ
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 02:08:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628489296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tl4nKXBCvbc19TQR9KPanRKQ/yZCsViQRD/gnFJQInY=;
 b=XZKKnF6STPLtoBO9hJwGekHAOwfUoxoRguoSV17589MnEkAx+p5oSrThG99I3ZAR5MuNDh
 Xas61VjCisPNMI3KB0TErpkgYehspp/b3/a3xl02YyUsLeGxxMfb0lxo8I2A5Ig7FkW8Rz
 VRCDEa5/AeTsqRAuja1xh0u+ja+BFEw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-IYmYwD_aN7S0Doa1nYZKnA-1; Mon, 09 Aug 2021 02:08:12 -0400
X-MC-Unique: IYmYwD_aN7S0Doa1nYZKnA-1
Received: by mail-wm1-f72.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so6455099wml.5
 for <qemu-devel@nongnu.org>; Sun, 08 Aug 2021 23:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tl4nKXBCvbc19TQR9KPanRKQ/yZCsViQRD/gnFJQInY=;
 b=KZ6GSh+x98jaz9WK+Brn7K8WjNO5xG5UO4jgfXY3kyxKlSJ/r01SU+sm13r6vi9cvW
 67J/EXkO7EN/UFPISpcLDM1wox7kWger/6h8xjRXaEXeM+Xt2PSR5jH+oDMgCiyP/hBh
 pW4b49eW4O2o7L9cVO7o6Sh3UJdkVAYdL+ntXCNnyfbB32xrAHMcsuHH8a8yxK1UeTbJ
 ZZ2PA7fnfapLkuYfvIr7PDoYYbTdAJwNZ8aSRmO2+HDLOUQqX0hdXwLy1EpH/sXRyzWV
 E91QY9CwB73YTAZsqUDHqbJd1AiCaSn5ypB4vT8F4GiHssmK7EdGm30ZUkvNRo7nCegd
 4PUQ==
X-Gm-Message-State: AOAM531VEbe7evLvECpP76je29QZVBpcZsHfr4/cmH/D25VlfQsTlQMn
 4K4qldlRoOYnhdaKgnFiMgzUAsoAHT4/VEKTDSbX8D3PvJei8dy7qAI2DoLn7RJM8CDWdlKQSAx
 Dlilosj3OO1KVk5k=
X-Received: by 2002:a05:6000:1106:: with SMTP id
 z6mr23478810wrw.296.1628489291607; 
 Sun, 08 Aug 2021 23:08:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykOrShTNSQdd6Sw2OYtqeqIclnSvvurrPiLqeP8Pr+HdDrUhFwzaoUaoWNDRu7OKnvwIj8yw==
X-Received: by 2002:a05:6000:1106:: with SMTP id
 z6mr23478790wrw.296.1628489291417; 
 Sun, 08 Aug 2021 23:08:11 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id g6sm1144580wrm.73.2021.08.08.23.08.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Aug 2021 23:08:10 -0700 (PDT)
Subject: Re: [PATCH-for-6.2 1/2] disas/nios2: Fix style in print_insn_nios2()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210807110939.95853-1-f4bug@amsat.org>
 <20210807110939.95853-2-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2a87e1da-c86b-eaca-e484-cf39e65b9469@redhat.com>
Date: Mon, 9 Aug 2021 08:08:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210807110939.95853-2-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Marek Vasut <marex@denx.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chris Wulff <crwulff@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/08/2021 13.09, Philippe Mathieu-Daudé wrote:
> We are going to modify this function, fix its style first.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   disas/nios2.c | 53 +++++++++++++++++++++++++--------------------------
>   1 file changed, 26 insertions(+), 27 deletions(-)

I guess it'd make sense to either re-indent the whole file or to bite the 
bullet and life with the checkpatch warnings here ... otherwise you now have 
one function that matches the QEMU coding style while the rest of the file 
looks completely different.

OTOH, we still can clean that up later, so in case you want to keep this patch:

Reviewed-by: Thomas Huth <thuth@redhat.com>


