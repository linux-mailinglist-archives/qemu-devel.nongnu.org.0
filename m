Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13914495FD3
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 14:32:36 +0100 (CET)
Received: from localhost ([::1]:53966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAu1q-0001rC-HO
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 08:32:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAtP3-0006TZ-D3; Fri, 21 Jan 2022 07:52:30 -0500
Received: from [2a00:1450:4864:20::32f] (port=46940
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAtOu-0006iM-Fg; Fri, 21 Jan 2022 07:52:28 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 az27-20020a05600c601b00b0034d2956eb04so22131317wmb.5; 
 Fri, 21 Jan 2022 04:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g+t6yiII3ah8Q6XGmUCcugyOHujFlgRMuCSsV8m7gwQ=;
 b=h1TTCTwg92R2ssC4l26L02y5swa58F+a2O3X6Iutm1jsv+Xv44e0+sZ3WFVH8VzBom
 U1uAbevATiUPaeA5kNFYLgn0VlE0FBnNrUv6MFSezRZHYwxgKsq7XaEs72h36zRUEcLF
 DXs7ure75MtyVl7jd3fEAxFit4CsD6DqJ5DhRhSLJkNI0ClexFOxRek5ckEQjriaigG5
 LVhKnbfdp1dlgb5ZWRKZahZYgqDvb03fMGbrBqfPYOUvMZsy4iLrlkWLGCRR5BhLt3n1
 elmxq6rZGOPz+Kr4s+3il1XE0ysb6sOz702Z84jmlODLONalWI5FeI6c9fBUoVq695Qs
 gJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g+t6yiII3ah8Q6XGmUCcugyOHujFlgRMuCSsV8m7gwQ=;
 b=EEJmHH56VnO6Vm3fUeEsNAPNA47ElUE5xldfhzxRkTPB61/a9jTRMrZrgkWhQqzvV0
 +o46qkcHxCIPzfRkhkxhWXpsOW9S0h0cl9pK90bRC4gFhrTRqeOgdjkUzMNDos5wm9Oe
 w1bo2DOtf+UuA/CMfPl6JM+7o2ghTSoR9eO/wUFgsdnrw0GDLR7uRbggWKbHVvjsMtNi
 fF8KToG41EBFTRHWSErIXT6EZ5mosxImJ3Aa4cDMZPgvjdorjKINxHlB0CAZ/+x1Gw5W
 8fdGpo+nHESc1nYoUFlt4Tyf6yXh/xLj2vh7El+ON7IetiLuX9CIvvV/76xlvYfdBzzd
 sZsw==
X-Gm-Message-State: AOAM532Z2QSS/lXdqH9hOvxLYfuT0RBTHSnFVvr+7gn+4TQ0BQJpd0MW
 +5IataEcIC49ETX2e4naEqo=
X-Google-Smtp-Source: ABdhPJy8hwHwMHl3mSHE+zejtgLi+cQ0UU0/E8ZcXmLUZRql7xzkqKtf7MM88x4KfW/tR0QJs50Qxg==
X-Received: by 2002:a5d:4c45:: with SMTP id n5mr3703198wrt.141.1642769455810; 
 Fri, 21 Jan 2022 04:50:55 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id p17sm5448704wrf.111.2022.01.21.04.50.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 04:50:55 -0800 (PST)
Message-ID: <3465d159-d1f8-fac2-a012-16102670c541@amsat.org>
Date: Fri, 21 Jan 2022 13:50:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 7/8] tests/lcitool: Remove libxml2
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-block@nongnu.org,
 Yonggang Luo <luoyonggang@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220121103623.288054-1-f4bug@amsat.org>
 <20220121103623.288054-8-f4bug@amsat.org>
 <8e4fd7fd-52aa-6039-c242-38d3b93b5130@redhat.com>
In-Reply-To: <8e4fd7fd-52aa-6039-c242-38d3b93b5130@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/21/22 12:47, Thomas Huth wrote:
> On 21/01/2022 11.36, Philippe Mathieu-Daudé wrote:
>> The previous commit removed all uses of libxml2.
>>
>> Update lcitool's qemu.yml and refresh the generated files by running:
>>
>>    $ make lcitool-refresh
> 
> Could you merge patch 4/8 and 7/8 so that there is only one refreshment
> patch in your series? ... it's a lot of churn otherwise...

Well I'd rather not because mixing the libudev removal with libxml2
seems confusing, but I can.

