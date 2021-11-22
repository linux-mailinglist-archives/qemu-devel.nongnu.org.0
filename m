Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD78B458C64
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 11:38:31 +0100 (CET)
Received: from localhost ([::1]:44126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp6iU-0005on-93
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 05:38:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mp6hD-00058K-Mo
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 05:37:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mp6h9-0006xu-ER
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 05:37:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637577424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jcuO0smZSX5vqmKP+8uo6zK40rWFWcX2+R6BGEngUZc=;
 b=iYSrkYvmj9amUEv/MG39cPu1nWCd3b4iL8dGhdfV9pwe08iecJm0TwQTv6e9gBe1IJ3RHA
 8cXaZUcOc808/f8zgkxJ2znn9vspPZYDYwQk8O6VHCRUJ+3eDgaYfi8pR/8A4CkiWhqYL9
 sSTeTCYZqk35/gjjWBuoVveSN6MYwN0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-_hjhEOKJMKeqEyPOvdrUNg-1; Mon, 22 Nov 2021 05:36:57 -0500
X-MC-Unique: _hjhEOKJMKeqEyPOvdrUNg-1
Received: by mail-wm1-f72.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so6616998wmb.3
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 02:36:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jcuO0smZSX5vqmKP+8uo6zK40rWFWcX2+R6BGEngUZc=;
 b=UA0aLlVMc3v+h+Yh50/uMKPHbTW+zNysKW6f7UygUx2nHpx1wIOPRWKLVRLp0enoPL
 e+hWfyOW/JCQvL/zoCS4tgzAqNHSNfZ2enjsLN1X1fCw7TeQYhh+rCeJWJPDthOJH0mv
 1Ty9gJZAri/ndj2Uk8HfVQNzt67GiFsijI6De4kOKRcYey3NYFCfKPmzCGGrLLUYSfiO
 1HOawY4qNL/57+Ktv1rx5IEWpSqeFBm2Dd7XJ/ChsT3zJOtcrEs4uSg+f505f75fTDRH
 c5k4A+JYm8lI3AHfoyctyYVl+r41BgwUbZ2sSvKRveLVvf4cDJtBT60F8DqEdw4WZksH
 iowg==
X-Gm-Message-State: AOAM5332s/h0CpRDwhPZpFaIFy88TPm2tdwVzduVeQJ17WcRwQ8uOb68
 yCyY8d+iRSrgipXzKwLTcyCbGEIaatFExXJn8MA/e8Rj4v+leHS+42En+75jHZndwkflOjjphcu
 Zyv64Er5QTQL74xA=
X-Received: by 2002:a05:600c:3516:: with SMTP id
 h22mr27689304wmq.62.1637577416680; 
 Mon, 22 Nov 2021 02:36:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgELf6xYwnqWBDze0XS7oT3R/42FW5sd44y0taEIP8xdgmQTg0NNnkFDDLZp5o6NG9AaR7ZQ==
X-Received: by 2002:a05:600c:3516:: with SMTP id
 h22mr27689261wmq.62.1637577416412; 
 Mon, 22 Nov 2021 02:36:56 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id b188sm8525714wmd.45.2021.11.22.02.36.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 02:36:55 -0800 (PST)
Message-ID: <b03ffb0c-0c4f-b792-f6c1-55014a0ae003@redhat.com>
Date: Mon, 22 Nov 2021 11:36:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] docs: Fix botched rST conversion of
 'submitting-a-patch.rst'
To: Kashyap Chamarthy <kchamart@redhat.com>
References: <20211119193118.949698-1-kchamart@redhat.com>
 <20211119193118.949698-2-kchamart@redhat.com>
 <56026d2a-0b9e-ff83-d953-a284a810a8ed@redhat.com> <YZtu59t8DoZZ15nQ@paraplu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YZtu59t8DoZZ15nQ@paraplu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/11/2021 11.20, Kashyap Chamarthy wrote:
> On Mon, Nov 22, 2021 at 10:51:15AM +0100, Thomas Huth wrote:
>> On 19/11/2021 20.31, Kashyap Chamarthy wrote:
>>> I completely botched up the merged[0] rST conversion of this document by
>>> accidentally dropping entire hunks (!) of text. :-(  I made it very hard
>>> for reviewers to spot it, as the omitted text was buried deep in the
>>> document.  To fix my hatchet job, I reconverted the "SubmitAPatch"
>>> wiki[1] page from scratch and replaced the existing rST with it, while
>>> making sure I incorporated previous feedback.
>>
>> Thanks for the quick update! I've now tripple-checked the differences
>> between the old wiki page and the new rst page, and I think with some
>> additional small changes on top (which I will do while picking up your
>> patch, see below), we should be fine now.
> 
> Thanks for your eagle eyes.
> 
> [...]
> 
>>> -- `QEMU Coding Style
>>> -  <https://qemu-project.gitlab.io/qemu/devel/style.html>`__
>>> -
>>> +-  `QEMU Coding Style <https://qemu-project.gitlab.io/qemu/devel/style.html>`__
>>
>> While we're at it, I'll replace the link with an internal link when picking
>> up this patch (so that it can also be used in offline documentation).
> 
> Sure.
> 
>>>    -  `Automate a checkpatch run on
>>> -   commit <http://blog.vmsplice.net/2011/03/how-to-automatically-run-checkpatchpl.html>`__
>>> +   commit <https://blog.vmsplice.net/2011/03/how-to-automatically-run-checkpatchpl.html>`__
>>> +-  Spell check your patches
>>
>> I'll add the link to https://wiki.qemu.org/Contribute/SpellCheck again.
> 
> Please don't -- I intentionally dropped it in a previous iteration based
> on this feedback from Peter Maydell:
> 
>      "I'm not sure that SpellCheck in particular is sufficiently baked
>      to be in the actual docs. I'd rather just drop the reference to it
>      from SubmitAPatch."
>      
>      (https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg00137.html)

Ok, so I'll drop that line completely (otherwise it does not really make 
sense to have it in this list after the "See also:" right in front of it).

  Thomas


