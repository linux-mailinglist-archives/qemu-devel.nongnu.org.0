Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EE13C922A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 22:35:10 +0200 (CEST)
Received: from localhost ([::1]:41094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3lb3-00025G-7A
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 16:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3la0-0001PJ-NE
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 16:34:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3lZy-0000D0-6E
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 16:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626294840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YXxwJu5ug9E/sFgUWCQPQwM5/0Pe6KrS+hdaMOntSnE=;
 b=XcKby123LXOHcrQWfxDmKyu7DgzDeMM7Fi9t0Sgxo4YiVe3KnxqQKBMD9tgKUJT3abMrly
 gbt+JIitT/U2xIyewTzg4ta+yCMk0RWKgEbISvil4J01DvLOHS6oejvhhdXRDR9VqXfqcs
 jHb+e37V8ti/Qg+hnm7jvujTM9T3mLw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-X5TM78gOMfa2iU2NgfphQw-1; Wed, 14 Jul 2021 16:33:59 -0400
X-MC-Unique: X5TM78gOMfa2iU2NgfphQw-1
Received: by mail-wm1-f72.google.com with SMTP id
 m6-20020a05600c4f46b0290205f5e73b37so1209269wmq.3
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 13:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YXxwJu5ug9E/sFgUWCQPQwM5/0Pe6KrS+hdaMOntSnE=;
 b=l9LPIM27b4TPfHOdJDTqGs3Bzfkek639AofwajbA+zYW9hbDPFtHpDFTPs57si99/O
 me/MTfyOno0/9diB4aWDoveIHzSFmEIbcUYgyu9l2TP7lXPFpdQY5LWpUOs/Uj9cTL+Q
 2DCEeWl5qS4VRgDq4KXoas8phnq5RGmeeXR6Os+LXyUaBtjYOTnBo7R2eYnjl5D+w4jd
 G44BBDYz2N8UUXobBUFDw8mZbiGQm3ojT0UzZZlRSc9du1qgPPLxiLFIWmBe8lSVSjQ2
 R6ltptDjmPz67dOnswwgKJ0SwFjWHamQAQTbEG22QC0ZzF5bAlmyt7AUZfo3XsoL0ol5
 fsHA==
X-Gm-Message-State: AOAM530B51eYJ2XCApaaiy5EzO+k9la3kOkJ11Vm9XzC2FkuY8mEse+e
 GHbwwJdyAQeCxMLU5vUqIRkSzoVTd3OYoBbKoF1DeZn9e1LE5etc3/zJ0zsJ9TMROu1GdS76SC3
 ERspC1LShOEFQW9M=
X-Received: by 2002:a1c:730d:: with SMTP id d13mr6255811wmb.129.1626294835894; 
 Wed, 14 Jul 2021 13:33:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOlE/9t+1nh8aQA4l+8ZyOH3B7TA6jdZYDpcBipP4rX2tcoEXFVEvUczqWYSlRPGQ4XR30VA==
X-Received: by 2002:a1c:730d:: with SMTP id d13mr6255798wmb.129.1626294835738; 
 Wed, 14 Jul 2021 13:33:55 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id z7sm2753863wmp.34.2021.07.14.13.33.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 13:33:55 -0700 (PDT)
Subject: Re: [PATCH-for-6.1] gitlab-ci: Extract EDK2 job rules to reusable
 section
To: qemu-devel@nongnu.org
References: <20210714101003.3113726-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <48427ddf-b670-4517-095d-d1fba7ae5151@redhat.com>
Date: Wed, 14 Jul 2021 22:33:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714101003.3113726-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/14/21 12:10 PM, Philippe Mathieu-Daudé wrote:
> All jobs depending on 'docker-edk2' job must use at most all
> the rules that triggers it. The simplest way to ensure that
> is to always use the same rules. Extract all the rules to a
> reusable section, and include this section (with the 'extends'
> keyword) in both 'docker-edk2' and 'build-edk2' jobs.
> 
> The problem was introduced in commit 71920809cea ("gitlab-ci.yml:
> Add jobs to build EDK2 firmware binaries"), but was revealed in
> commit 1925468ddbf ("docker: EDK2 build job depends on EDK2
> container") and eventually failed on CI:
> https://gitlab.com/qemu-project/qemu/-/pipelines/335995843
> 
> Reported-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> If this is a correct fix, I'll send a similar fix for the
> OpenSBI jobs.
> ---
>  .gitlab-ci.d/edk2.yml | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)

Queued to fw-edk2 tree.


