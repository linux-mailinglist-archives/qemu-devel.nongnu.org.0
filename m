Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EBB4196A2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:47:07 +0200 (CEST)
Received: from localhost ([::1]:45974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUruM-0005Hc-Nb
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUrpl-0000sR-HC
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:42:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUrpj-0004XI-SM
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632753739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XWycShd6mg9njmBi9owso832c2/z/y+2eX3eSLlP2Vg=;
 b=hpKnkx6NpfP+YDNGudwozwF42s+3S8G2EirVHYL54YT/RnPGS4kUZ2a6SOBqws9cLqTNYC
 xvmoLgSEgtJ+aBfJnaqCk4YgxcHNrt6CIG1G1HNoQ7dJU4MxTF6dA8N8ybc/xXCF8lC3Wl
 5UR4Xfjr4m0iK28SFipZvJ3ttmi3ybM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-Br_h_DogM_awvn2j_QI8xQ-1; Mon, 27 Sep 2021 10:42:16 -0400
X-MC-Unique: Br_h_DogM_awvn2j_QI8xQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 a137-20020a1c7f8f000000b0030cda9c0feeso328564wmd.7
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 07:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XWycShd6mg9njmBi9owso832c2/z/y+2eX3eSLlP2Vg=;
 b=CpfmmGXFTQ7sSXgrbLlTP/Ju6tSoSFmYP8yu8YyUSyzHtr1RAcE8F47uQ7uw9R/V+Y
 e/zHlDIta8FYYauMMrOz8WIMi79pQTeMjYjKAdK1A6hnV2dlCxa5RMHN1QibKIeYk7yy
 82/EYXrqW41IFo2K2d7p55TMgTIpRxKbU8GR4TPnBZkNLEDkv9xivXe+RGjehGKy/+3r
 HqtOIzXKlTJY6SJs56K4YPG2fn7oeKPhVl68oEKOaLjBzSogWliql3k2Xtdlouw/2U66
 hNGBq1k7CWF1LXtiQBv+fIR8DIJhYVPGtsbE/S+BWfvVilgg8LIyAxXsua0AkiSU9X2C
 P9Mw==
X-Gm-Message-State: AOAM531RsCxxVM3cM8bnLTNUDmF7tltEGrSoylrwqXfMzUYIk4M0BM8K
 3XMguIaWUFQOQ04z4StFe3LzyplmRA5A8tijqqQhufpwfk9NIMfJsvRdPvLUnOzrjhgQ/8EExbl
 bb/ASArsiMNT4I+k=
X-Received: by 2002:a1c:751a:: with SMTP id o26mr331410wmc.94.1632753734903;
 Mon, 27 Sep 2021 07:42:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsOoOjvHlxkNF96tXqn6w0VT1IA7v+jn4PtsWz7PDmqS1NvvrNmzUjEMKt7mON/igCucZyvQ==
X-Received: by 2002:a1c:751a:: with SMTP id o26mr331388wmc.94.1632753734781;
 Mon, 27 Sep 2021 07:42:14 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id z5sm24271124wmp.26.2021.09.27.07.42.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 07:42:14 -0700 (PDT)
Message-ID: <78269486-4d98-68e9-0eb2-0045f36a7a33@redhat.com>
Date: Mon, 27 Sep 2021 16:42:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 15/16] tests/acceptance/ppc_prep_40p.py: clean up unused
 import
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210924185506.2542588-1-crosa@redhat.com>
 <20210924185506.2542588-16-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210924185506.2542588-16-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Willian Rampazzo <wrampazz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 20:55, Cleber Rosa wrote:
> Just a removal of an unused imported symbol.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/ppc_prep_40p.py | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


