Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 667FE3E40BA
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 09:15:57 +0200 (CEST)
Received: from localhost ([::1]:34240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCzVs-0001R4-Ft
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 03:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCzUf-0000k7-T2
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 03:14:41 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:33697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCzUe-0000VK-7p
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 03:14:41 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 m36-20020a05600c3b24b02902e67543e17aso2455288wms.0
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 00:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I8HlPVlSJnpFZ+MgYzC8ljOaSIKPzClbFpOQJo+PnwU=;
 b=In3hlSk4htP55k4YZNZyso3WixSU8hYhzzQAQ6K9TMr6Ibyqfshl+JhNfTv937Am8h
 eUiMoXuY3HPv2C/1ahilsrwflcsHMpjburJBKEi4hX8Zdtgk9nqj5icGIJZMybJFufOl
 34DkzPJdj82V6lPWCe9U8aQCkWCvTITqm3ho8NDIM1GTclt30yQAatBAe/aeBhNF1Fhc
 K4mdYtebBxbv+O7ffWoKOIeo3NP5o1gzaPTW+JzYcvaOfpjYdvm0I25dHFLiHALnmtbZ
 V/iG8R7SF/D+VGuHGR70CQAtA0eR03dHYfmMnimeU+NkCzUZLPk0ulMPk16PV8F4FOfq
 3VBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I8HlPVlSJnpFZ+MgYzC8ljOaSIKPzClbFpOQJo+PnwU=;
 b=m6B+6yt8OFFojfz/pLs2VTBwkCBXsxFCFmVVy9cuqU1wGWt28fLmw7h0P20Sik3thW
 xuiRfTDetFMeC68L/3UHd5LRp4a6v0pjQsqeOR2TE8P/M3joUzEwv1OikGuByAn1uxyJ
 vimCP873C5JzAX1fwU1VLuluqsXc/T8oCACNKaLsCgGoo9gsjnzqtAdNyXMKjgFhOxNm
 NnPy93IlHP4sBiIjv12Ft5j5WHXVhyqxOaVhNgpu2N3XYW37e97wvMjLL6mAK3zRww2l
 YhU+xjcX7Uc/0LcwMon9JVMEs82gpxI3Nt2QRPjmYU3WHK/gAE3SoSNbiRcecmYK1XdS
 pBAw==
X-Gm-Message-State: AOAM531l5PioDGv3Vj/emS0VNWLEbBlREV8EqLNUynDtKYLeTHPAQEMt
 NJiiRtNSCp560zZQlQ/DTGI=
X-Google-Smtp-Source: ABdhPJx2YRqueHBm/BBO1u/lgTppgfa8ITrIkK5f1W28WvpeMB8hZ/lEbITCcYUoowVBMKAQ8IPSNA==
X-Received: by 2002:a05:600c:1d12:: with SMTP id
 l18mr15029608wms.88.1628493278403; 
 Mon, 09 Aug 2021 00:14:38 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id k31sm1043112wms.31.2021.08.09.00.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 00:14:37 -0700 (PDT)
Subject: Re: [PATCH-for-6.2 1/2] disas/nios2: Fix style in print_insn_nios2()
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210807110939.95853-1-f4bug@amsat.org>
 <20210807110939.95853-2-f4bug@amsat.org>
 <2a87e1da-c86b-eaca-e484-cf39e65b9469@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9018abc2-b763-b2c8-00de-17209ed9afcf@amsat.org>
Date: Mon, 9 Aug 2021 09:14:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2a87e1da-c86b-eaca-e484-cf39e65b9469@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Peter for overall style recommendation.

On 8/9/21 8:08 AM, Thomas Huth wrote:
> On 07/08/2021 13.09, Philippe Mathieu-Daudé wrote:
>> We are going to modify this function, fix its style first.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   disas/nios2.c | 53 +++++++++++++++++++++++++--------------------------
>>   1 file changed, 26 insertions(+), 27 deletions(-)
> 
> I guess it'd make sense to either re-indent the whole file or to bite
> the bullet and life with the checkpatch warnings here ... otherwise you
> now have one function that matches the QEMU coding style while the rest
> of the file looks completely different.

Yeah I didn't know what to do here, I remember a discussion
(3 years ago?) "disas/..." is old import from binutils libopcode,
so better not diverge the style. But the capstone updates shuffled
things a bit. And nobody is tracking the parent project.
I'm tempted to keep the style and ignore the warnings.

> OTOH, we still can clean that up later, so in case you want to keep this
> patch:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks.

