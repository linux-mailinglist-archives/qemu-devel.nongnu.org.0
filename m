Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 063EC4DC9A6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 16:12:55 +0100 (CET)
Received: from localhost ([::1]:55902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUro5-0004fz-Id
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 11:12:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nUrep-0005BX-8R
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:03:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nUrel-0006ec-M5
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:03:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647529394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GxPLnsLQTib6cAO9dRhBWohZ6Mxv7NizHlS1r7k17AU=;
 b=duNTrlplCyJIXjO9Og0ay2T/ou5vjBaCS7/JEClxxmX0IcSVi/LyxM6qoRuEbT748251NV
 5lRJJ7yK3eezVDCmomskqtrUHKBlOns1BEv95ZF36ENlJZuVR/OZpzOVkvCNO66X5hgaB0
 KVIsD3keD5oxLeMhnr387EcN19wI20Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-BA44v74CONimfrEHhkFjrw-1; Thu, 17 Mar 2022 11:03:11 -0400
X-MC-Unique: BA44v74CONimfrEHhkFjrw-1
Received: by mail-wr1-f70.google.com with SMTP id
 p18-20020adfba92000000b001e8f7697cc7so1622120wrg.20
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 08:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=GxPLnsLQTib6cAO9dRhBWohZ6Mxv7NizHlS1r7k17AU=;
 b=v384CkX11bFW6nJl0u2lqJktbZ6A1SQ8OECS9vxCA/i9c516SwMOjS5CR72/TgS7/N
 6JjDxmzTpnFbIrnSF65m5Q3cQcoAn4qRYIgNPR8+Jprs1B2dVvKp1zTwXK3DjKdcTFIx
 lNUqGvnB41YUZXUb0IL7Syf5WOQbFr84RxVTGiT7ze9dCJ5l0ewH3kKM9Ra9ClnPq/Q9
 hH1v19LXetWb34q3Q2ArRzYkyX0HdXpy8z89+c4JvEAUHGdZxlTHbF7bTmUgr5XlxFp+
 NYvOo5cTgpX9wZ1wQGQXvIlZVngmufz5o1QA4V9WGJoaskeOp/dipUmG2YdgvN07vkJf
 /Iig==
X-Gm-Message-State: AOAM530pLv3kszcCNH6u9V1bnV/JbCQYDS6XixQNK3jwxcTGALX5Kv8V
 HCr1Il8bvpbAvHUh+JIjQ2od1BhcMYv8vegDlekrtKAQs2vc8Xm2FLrOi8rvFJOrT5nLnVzUnYK
 TcBoLViNVg1vYISA=
X-Received: by 2002:a7b:c5d0:0:b0:389:fe85:3d79 with SMTP id
 n16-20020a7bc5d0000000b00389fe853d79mr12179801wmk.77.1647529390422; 
 Thu, 17 Mar 2022 08:03:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKnlcfWvnkRaBVthEcJsPVUb6Sm4RtimZjflbUmisTeeKHboTMJ9MMzynTMMK7F7dBLY6Cuw==
X-Received: by 2002:a7b:c5d0:0:b0:389:fe85:3d79 with SMTP id
 n16-20020a7bc5d0000000b00389fe853d79mr12179759wmk.77.1647529390110; 
 Thu, 17 Mar 2022 08:03:10 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 u4-20020adfdb84000000b001e8d8ac5394sm4505004wri.110.2022.03.17.08.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 08:03:09 -0700 (PDT)
Date: Thu, 17 Mar 2022 15:03:07 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [libvirt RFC] virFile: new VIR_FILE_WRAPPER_BIG_PIPE to improve
 performance
Message-ID: <YjNNqzb7eBBwMFJN@work-vm>
References: <20220312163001.3811-1-cfontana@suse.de>
 <Yi94mQUfrxMVbiLM@redhat.com>
 <34eb53b5-78f7-3814-b71e-aa7ac59f9d25@suse.de>
 <Yi+ACeaZ+oXTVYjc@redhat.com>
 <2d1248d4-ebdf-43f9-e4a7-95f586aade8e@suse.de>
 <7c641d9d-fffa-e21b-7ae2-12ad35c0c238@suse.de>
 <YjMMfnEjXsz3Vi8h@redhat.com>
 <f94f9d54-b71b-e8ff-1a5b-931e42120e4e@suse.de>
 <35da2366-99e4-7680-a1c5-46aff83d747c@suse.de>
MIME-Version: 1.0
In-Reply-To: <35da2366-99e4-7680-a1c5-46aff83d747c@suse.de>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Claudio Fontana (cfontana@suse.de) wrote:
> On 3/17/22 2:41 PM, Claudio Fontana wrote:
> > On 3/17/22 11:25 AM, Daniel P. Berrangé wrote:
> >> On Thu, Mar 17, 2022 at 11:12:11AM +0100, Claudio Fontana wrote:
> >>> On 3/16/22 1:17 PM, Claudio Fontana wrote:
> >>>> On 3/14/22 6:48 PM, Daniel P. Berrangé wrote:
> >>>>> On Mon, Mar 14, 2022 at 06:38:31PM +0100, Claudio Fontana wrote:
> >>>>>> On 3/14/22 6:17 PM, Daniel P. Berrangé wrote:
> >>>>>>> On Sat, Mar 12, 2022 at 05:30:01PM +0100, Claudio Fontana wrote:
> >>>>>>>> the first user is the qemu driver,
> >>>>>>>>
> >>>>>>>> virsh save/resume would slow to a crawl with a default pipe size (64k).
> >>>>>>>>
> >>>>>>>> This improves the situation by 400%.
> >>>>>>>>
> >>>>>>>> Going through io_helper still seems to incur in some penalty (~15%-ish)
> >>>>>>>> compared with direct qemu migration to a nc socket to a file.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> >>>>>>>> ---
> >>>>>>>>  src/qemu/qemu_driver.c    |  6 +++---
> >>>>>>>>  src/qemu/qemu_saveimage.c | 11 ++++++-----
> >>>>>>>>  src/util/virfile.c        | 12 ++++++++++++
> >>>>>>>>  src/util/virfile.h        |  1 +
> >>>>>>>>  4 files changed, 22 insertions(+), 8 deletions(-)
> >>>>>>>>
> >>>>>>>> Hello, I initially thought this to be a qemu performance issue,
> >>>>>>>> so you can find the discussion about this in qemu-devel:
> >>>>>>>>
> >>>>>>>> "Re: bad virsh save /dev/null performance (600 MiB/s max)"
> >>>>>>>>
> >>>>>>>> https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg03142.html
> >>
> >>
> >>> Current results show these experimental averages maximum throughput
> >>> migrating to /dev/null per each FdWrapper Pipe Size (as per QEMU QMP
> >>> "query-migrate", tests repeated 5 times for each).
> >>> VM Size is 60G, most of the memory effectively touched before migration,
> >>> through user application allocating and touching all memory with
> >>> pseudorandom data.
> >>>
> >>> 64K:     5200 Mbps (current situation)
> >>> 128K:    5800 Mbps
> >>> 256K:   20900 Mbps
> >>> 512K:   21600 Mbps
> >>> 1M:     22800 Mbps
> >>> 2M:     22800 Mbps
> >>> 4M:     22400 Mbps
> >>> 8M:     22500 Mbps
> >>> 16M:    22800 Mbps
> >>> 32M:    22900 Mbps
> >>> 64M:    22900 Mbps
> >>> 128M:   22800 Mbps
> >>>
> >>> This above is the throughput out of patched libvirt with multiple Pipe Sizes for the FDWrapper.
> >>
> >> Ok, its bouncing around with noise after 1 MB. So I'd suggest that
> >> libvirt attempt to raise the pipe limit to 1 MB by default, but
> >> not try to go higher.
> >>
> >>> As for the theoretical limit for the libvirt architecture,
> >>> I ran a qemu migration directly issuing the appropriate QMP
> >>> commands, setting the same migration parameters as per libvirt,
> >>> and then migrating to a socket netcatted to /dev/null via
> >>> {"execute": "migrate", "arguments": { "uri", "unix:///tmp/netcat.sock" } } :
> >>>
> >>> QMP:    37000 Mbps
> >>
> >>> So although the Pipe size improves things (in particular the
> >>> large jump is for the 256K size, although 1M seems a very good value),
> >>> there is still a second bottleneck in there somewhere that
> >>> accounts for a loss of ~14200 Mbps in throughput.
> 
> 
> Interesting addition: I tested quickly on a system with faster cpus and larger VM sizes, up to 200GB,
> and the difference in throughput libvirt vs qemu is basically the same ~14500 Mbps.
> 
> ~50000 mbps qemu to netcat socket to /dev/null
> ~35500 mbps virsh save to /dev/null
> 
> Seems it is not proportional to cpu speed by the looks of it (not a totally fair comparison because the VM sizes are different).

It might be closer to RAM or cache bandwidth limited though; for an extra copy.

Dave

> Ciao,
> 
> C
> 
> >>
> >> In the above tests with libvirt, were you using the
> >> --bypass-cache flag or not ?
> > 
> > No, I do not. Tests with ramdisk did not show a notable difference for me,
> > 
> > but tests with /dev/null were not possible, since the command line is not accepted:
> > 
> > # virsh save centos7 /dev/null
> > Domain 'centos7' saved to /dev/null
> > [OK]
> > 
> > # virsh save centos7 /dev/null --bypass-cache
> > error: Failed to save domain 'centos7' to /dev/null
> > error: Failed to create file '/dev/null': Invalid argument
> > 
> > 
> >>
> >> Hopefully use of O_DIRECT doesn't make a difference for
> >> /dev/null, since the I/O is being immediately thrown
> >> away and so ought to never go into I/O cache. 
> >>
> >> In terms of the comparison, we still have libvirt iohelper
> >> giving QEMU a pipe, while your test above gives QEMU a
> >> UNIX socket.
> >>
> >> So I still wonder if the delta is caused by the pipe vs socket
> >> difference, as opposed to netcat vs libvirt iohelper code.
> > 
> > I'll look into this aspect, thanks!
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


