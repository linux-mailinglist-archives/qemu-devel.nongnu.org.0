Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E3C3B5857
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 06:34:00 +0200 (CEST)
Received: from localhost ([::1]:49864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxiy7-0008Nq-Ef
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 00:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lxiwB-0007ep-3f
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 00:31:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lxiw7-0003LV-8m
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 00:31:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624854714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ERwC3BBYfbKLFgGnM0K9Ija34zculZeinfBCDZhHmeg=;
 b=JOQeLcT7a1K8ePEMfWIcNEEkMDIetXO0471Sk8VFECIPTU8pFFDSvWATaGRKKZkTr93yqG
 /RwgTv5e8at6LFVK9vpPHg6t4ktuZWvI2fouDfRh3vgSMHS1WPw9fqBh8vGGA4bFndqrHA
 Z95DRpJwfgn/X4+jjzRaqEX9/l+ajr8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-6QKZtCVoMPqal6ymHvBY1g-1; Mon, 28 Jun 2021 00:31:50 -0400
X-MC-Unique: 6QKZtCVoMPqal6ymHvBY1g-1
Received: by mail-wm1-f69.google.com with SMTP id
 k16-20020a7bc3100000b02901d849b41038so8400099wmj.7
 for <qemu-devel@nongnu.org>; Sun, 27 Jun 2021 21:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ERwC3BBYfbKLFgGnM0K9Ija34zculZeinfBCDZhHmeg=;
 b=IhiHGnltB7UtM7iINKJW+YO0MWkNHqKdd/5ba3F6ejj5JG3GX7K4mSeD1HtVJD1Qnm
 c3BdId2LalIihoTVDfLiPNNd5TBhpessWN2/arw7CQdDmasNSucPUw2rI+U+34OIdhbs
 GeRePtMrtuznnRGK85unQ5VFeBOJ77AcmlvjtbV05hOX8uU81UHyQHC4sjPI3Fco6B79
 Zscjxb90rKJvRSVd7bPy7dh9o5/CC5dp29+ORZaru48RoV32KNE82ZRMibpVQS45KQBN
 3KpCKpcT6DwgpVxfybRoO1OpW3vnVR6mk4tHZ76nzYl08kFKfjBoLOWeLdqVxWwj5eHE
 s4yQ==
X-Gm-Message-State: AOAM533s6FvV/4QqTTyVKtcf0m22yGPXlyvVrar8H/b0u8aP+r7TWQzm
 v1H8A+4KAgf6G5SBPvn2wr3iyH4YksKANzDTlp1EWUCxPb/9M73S6hw0BAT2dkTKe9Ujta4cVZN
 9Rrk+xXqHIPAXZ/Q=
X-Received: by 2002:a5d:6d81:: with SMTP id l1mr24355847wrs.282.1624854709275; 
 Sun, 27 Jun 2021 21:31:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqapgM6YhxbhHFuYgV9il8HcNR9GUOwWzpaLivk8muEy+TBQH5dz7Gi8BNRVF0Of4D0wkdiQ==
X-Received: by 2002:a5d:6d81:: with SMTP id l1mr24355835wrs.282.1624854709087; 
 Sun, 27 Jun 2021 21:31:49 -0700 (PDT)
Received: from thuth.remote.csb (pd9575ea7.dip0.t-ipconnect.de.
 [217.87.94.167])
 by smtp.gmail.com with ESMTPSA id q19sm17710154wmc.44.2021.06.27.21.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jun 2021 21:31:48 -0700 (PDT)
To: BALATON Zoltan <balaton@eik.bme.hu>, Richard Zak <richard.j.zak@gmail.com>
References: <CAOakUfODNr9UCpbNyzavk3n8ycD5fNFU0VBv87fVWLhrw5O2Ow@mail.gmail.com>
 <f4c552df-ba24-e4b7-7dad-57c057788dc5@redhat.com>
 <CAOakUfNdwN-5Tt8z58wm-c+gnAp_2JkmdaVzDJyt5J423nzaEQ@mail.gmail.com>
 <CANCZdfpvUqTb1BkYfRxA5GMk4NC+=iNAJYdEoc1kSc6ydpc8Tg@mail.gmail.com>
 <CAOakUfOUdn2QThCzX==KOC83hOAjMc4OEKmto9ySDh-bEk80LQ@mail.gmail.com>
 <92ed67e4-777-1361-1217-2b5b708fc15@eik.bme.hu>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Qemu on Haiku
Message-ID: <36125248-9607-197f-453c-b1c75a0fe2e8@redhat.com>
Date: Mon, 28 Jun 2021 06:31:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <92ed67e4-777-1361-1217-2b5b708fc15@eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.696,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.765, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/06/2021 02.38, BALATON Zoltan wrote:
> On Sun, 27 Jun 2021, Richard Zak wrote:
>> Hopefully last questions:
[...]
>> 2) Is it acceptable to have a patch for the configure script, or is that
>> generated? I found some Haiku-related issues there
> 
> The configure script is not generated, it's just a shell script so you can 
> send patches for it I think.

Right, QEMU's "configure" script is handmade.

>> Regarding prior email:
>> Seems like the big tasks are:
>> 1) Haiku VM for continuous integration. Is this hosted in Amazon or other
>> cloud infrastructure?

The QEMU project is using gitlab-CI, Travis-CI and Cirrus-CI, as CI systems 
that could be used by everybody. However, most of these are based on 
Containers, so it's not possible to run an OS there that is completely 
different from the ones that are offered by default.
Now that's where the tests in the tests/vm/ directory come in very handy. 
These are based on KVM, so they can run on all Linux hosts that have 
virtualization enabled. Thus if the tests/vm/haiku.x86_64 test would work 
more properly, it could get run on KVM-enabled machines, too.

>> 3) Supporting aspects of the qemu code relevant to Haiku (found an issue in
>> slirp & configure script)

slirp is a separate project now, if you want to fix something in there, 
please report it here:

  https://gitlab.freedesktop.org/slirp/libslirp

  Thomas


