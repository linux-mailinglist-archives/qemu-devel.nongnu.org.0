Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FD0606657
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 18:56:03 +0200 (CEST)
Received: from localhost ([::1]:53116 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYpr-00053w-S0
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:56:00 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYpf-0004g4-8y
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1olYSt-0000BG-6Z
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:32:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1olYSr-0008V7-Od
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:32:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666283531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hZs+j15yU9471w93OAmuQdRLiwbhW3O5F+nclFlBQPg=;
 b=DYOzwrv6tffs49ChwxeNRB8q7UBDYd4F9MDlB+lW/+feRzkt4uZmEgfHcy8dd+lptzW1F2
 d6Ox/vC56lZbj2VPn8r4M3gt9Zs5q1cN3qDovdkVX3WnnTNzBepyCVAOAYB3jLMAbxIvwX
 ZDjEhyUWhjhxN2YcQ8sX9oe0nzAA3dM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-63-EHFpE8TPMX--nXlMsMrKHQ-1; Thu, 20 Oct 2022 12:32:09 -0400
X-MC-Unique: EHFpE8TPMX--nXlMsMrKHQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 gd8-20020a05622a5c0800b0039cb77202eeso15434737qtb.0
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 09:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hZs+j15yU9471w93OAmuQdRLiwbhW3O5F+nclFlBQPg=;
 b=6QkGZauKPka2b3azzg8HKFBORLS5dGEs0DLVXuS3WDXcYsGEkkPVpa6D/81HPvM3Si
 sGf3C99g1YHt/V7Qslaa1R9FWoABycKAP/0Dq9Wti8rqLfGTmhSn6rAu6XiQTKFmQZcJ
 eSAXKwFm4Btyl3lhCM+9LJnJCS98lsUAmUJB37HRi3KHEzxU3Nk78cjXcRBLzeJgTr8i
 LWIHIwbtUMsrK5Eet3OxdRvWoP25KBTH6QSrIkjTmwflcCsDTiMgFJXPTPhei+FYrHBG
 crONkWobR8uCMJDmVqFWVaCl1Yib+3HAilVFvMh5QVQqafLepMz3n0YGwkSQcKOVWjGs
 tFHw==
X-Gm-Message-State: ACrzQf2beYEDXYBNQdmk21NTAcGeZi+unKWpPZyafkdrCZ/F7sIVPPAV
 eJssU2YMFxpqxfScMMGcn8TwFVgI+zEa16nq4+t1kGOOtQznI5w6eZAXCDculFd2qcoOSEXlsdx
 6q4yrl451RpCna8M=
X-Received: by 2002:a05:622a:607:b0:39c:e9b9:c043 with SMTP id
 z7-20020a05622a060700b0039ce9b9c043mr12096367qta.300.1666283529311; 
 Thu, 20 Oct 2022 09:32:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4bOYaKCd08URsMmpWFIHv/i6Q6VAAppyaUxqUQvGAgtAhCsn+TkdufVzzX42evbnwQM0O7zw==
X-Received: by 2002:a05:622a:607:b0:39c:e9b9:c043 with SMTP id
 z7-20020a05622a060700b0039ce9b9c043mr12096337qta.300.1666283529049; 
 Thu, 20 Oct 2022 09:32:09 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 x12-20020a05620a448c00b006ec5238eb97sm7652814qkp.83.2022.10.20.09.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 09:32:08 -0700 (PDT)
Date: Thu, 20 Oct 2022 12:32:06 -0400
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Prerna Saxena <prerna.saxena@nutanix.com>
Subject: Re: MultiFD and default channel out of order mapping on receive side.
Message-ID: <Y1F4BgFskXizW2za@x1n>
References: <9f02255a-ceb9-9ca6-2606-b91c5e9e6459@nutanix.com>
 <Y0fJFcj9+wcnKYqd@redhat.com>
 <a4f67b8d-21ec-4261-6ffb-3162c854ce8f@nutanix.com>
 <Y00+tsrBs2m2CH6R@redhat.com> <Y03F97gmi7N4cyMM@x1n>
 <Y05hVC7AXdc0Ak4z@redhat.com> <Y069YMtwwOrmI6lM@x1n>
 <Y08T+DZQXh/89O/g@x1n>
 <4c1e4137-a686-427c-df3e-22f299a39478@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4c1e4137-a686-427c-df3e-22f299a39478@nutanix.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 20, 2022 at 08:14:19PM +0530, manish.mishra wrote:
> I had one concern, during recover we do not send any magic. As of now we
  do not support multifd with postcopy so it should be fine, we can do
  explict checking for non-recovery case. But i remember from some
  discussion in future there may be support for multiFD with postcopy or
  have multiple postcopy preempt channels too, then proper handshake will
  be required? So at some point we want to take that path? For now i agree
  approach 1 will be good as suggested by Daniel it can be backported
  easily to older qemu's too.

Yes for the long run I think we should provide a generic solution for all
the channels to be established for migration purpose.

Not to mention that as I replied previously to my original email, the trick
won't easily work with dest QEMU where we need further change to allow qemu
to accept new channels during loading of the VM.

Considering the complexity that it'll take just to resolve the prempt
channel ordering, I think maybe it's cleaner we just look for the long term
goal.

-- 
Peter Xu


