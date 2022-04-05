Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5E14F2933
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 10:47:31 +0200 (CEST)
Received: from localhost ([::1]:39148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbeqX-0002Bi-W8
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 04:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nbef2-0005rY-4I
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 04:35:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nbeez-0000XK-68
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 04:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649147729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yW7Yf+EHBBEEy3DggO64YrOm9PwZYA7kBGm6rbsOYU8=;
 b=MwSxxHMFS1mDnyxm+1ovZMWDAhuvwQRhHy1h3gtAmH2zIcfxC8x9DB1YTgkcG9FkEJHy6I
 ZC6SpaROWIHF13o6A1Mtzy+Xn6oI/M1ljbuOmNe2wWFbMCI9GgAXbODpTRCWU1zuTWvba9
 g0DOYl0QnsMCTI3MC25pusGFQJg6Exk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-jbvejpqTN0O6QgwHDCsHFw-1; Tue, 05 Apr 2022 04:35:28 -0400
X-MC-Unique: jbvejpqTN0O6QgwHDCsHFw-1
Received: by mail-wm1-f72.google.com with SMTP id
 n19-20020a05600c305300b0038e72cfc391so937483wmh.9
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 01:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=yW7Yf+EHBBEEy3DggO64YrOm9PwZYA7kBGm6rbsOYU8=;
 b=Hu+vB0GJAzCQf57FXHbs5AMjHvuNb2hB8hgvhSJm81NwnjEcssWux306qoagk7Jhtt
 U32VHfESgRy2BDOm+ZyJinM3+oM3w7GIyXkNFNGytscBmVuNBLgZlsQx7xJPA3zInVwv
 TV/nPpZsd0EKk1xdX9vcZtOHyBDB2XV6YunBJT//JSDqDklYjiuAjEUJ5KkzlIwh0rBp
 mx2xVSQgm+gvdSz7/HEQNx9gxO2l4YrmunUCxTDDZLDsleHlKB6gayO7Vwl+AZ33EYUH
 fU3j6bKC2XGIJ9gLZMEcMzm8PqOLBdiD5fI7yWf927b3vr8JbogMtWyLJtMjhpKsX393
 k9iQ==
X-Gm-Message-State: AOAM533GR4YilhplTQOBob3hfxOSxg4HMf4A+LKk+b7DUumkoK6n3n12
 uiNgfeAKiqbnsuIfN/+u9Ans26qFRfGYjsxWGk4haYvknc8DX/m7ULGbaMUJrKhhq3wK7jCMIoN
 3S0ZhiVex0eFFEJo=
X-Received: by 2002:a05:600c:4f45:b0:38c:d0ba:a44a with SMTP id
 m5-20020a05600c4f4500b0038cd0baa44amr1939739wmq.155.1649147727292; 
 Tue, 05 Apr 2022 01:35:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG0aMsni81PwxG3eJSNK6FEHGGpduWwz2qMLIEOxAVgIxC+xh816/HFKtU/WziIUlKn774lg==
X-Received: by 2002:a05:600c:4f45:b0:38c:d0ba:a44a with SMTP id
 m5-20020a05600c4f4500b0038cd0baa44amr1939724wmq.155.1649147727030; 
 Tue, 05 Apr 2022 01:35:27 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b0038cadf3aa69sm2384109wmb.36.2022.04.05.01.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 01:35:26 -0700 (PDT)
Date: Tue, 5 Apr 2022 09:35:24 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [libvirt RFC] virFile: new VIR_FILE_WRAPPER_BIG_PIPE to improve
 performance
Message-ID: <Ykv/TLS8zgwh/ros@work-vm>
References: <7c641d9d-fffa-e21b-7ae2-12ad35c0c238@suse.de>
 <YjMMfnEjXsz3Vi8h@redhat.com>
 <f94f9d54-b71b-e8ff-1a5b-931e42120e4e@suse.de>
 <35da2366-99e4-7680-a1c5-46aff83d747c@suse.de>
 <YjNNqzb7eBBwMFJN@work-vm>
 <737974fa-905c-d171-05b0-ec4df42bc762@suse.de>
 <Yj2nh1LRZ54BXuds@redhat.com>
 <47af35ec-2ca8-26ae-f4e4-d81f18f2a05b@suse.de>
 <YkFycBMT0HsYUfJr@redhat.com>
 <c5924d0a-78e4-29ed-e856-e8ab823bc560@suse.de>
MIME-Version: 1.0
In-Reply-To: <c5924d0a-78e4-29ed-e856-e8ab823bc560@suse.de>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, andrea.righi@canonical.com,
 Jiri Denemark <jdenemar@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Claudio Fontana (cfontana@suse.de) wrote:
> On 3/28/22 10:31 AM, Daniel P. Berrangé wrote:
> > On Sat, Mar 26, 2022 at 04:49:46PM +0100, Claudio Fontana wrote:
> >> On 3/25/22 12:29 PM, Daniel P. Berrangé wrote:
> >>> On Fri, Mar 18, 2022 at 02:34:29PM +0100, Claudio Fontana wrote:
> >>>> On 3/17/22 4:03 PM, Dr. David Alan Gilbert wrote:
> >>>>> * Claudio Fontana (cfontana@suse.de) wrote:
> >>>>>> On 3/17/22 2:41 PM, Claudio Fontana wrote:
> >>>>>>> On 3/17/22 11:25 AM, Daniel P. Berrangé wrote:
> >>>>>>>> On Thu, Mar 17, 2022 at 11:12:11AM +0100, Claudio Fontana wrote:
> >>>>>>>>> On 3/16/22 1:17 PM, Claudio Fontana wrote:
> >>>>>>>>>> On 3/14/22 6:48 PM, Daniel P. Berrangé wrote:
> >>>>>>>>>>> On Mon, Mar 14, 2022 at 06:38:31PM +0100, Claudio Fontana wrote:
> >>>>>>>>>>>> On 3/14/22 6:17 PM, Daniel P. Berrangé wrote:
> >>>>>>>>>>>>> On Sat, Mar 12, 2022 at 05:30:01PM +0100, Claudio Fontana wrote:
> >>>>>>>>>>>>>> the first user is the qemu driver,
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> virsh save/resume would slow to a crawl with a default pipe size (64k).
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> This improves the situation by 400%.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Going through io_helper still seems to incur in some penalty (~15%-ish)
> >>>>>>>>>>>>>> compared with direct qemu migration to a nc socket to a file.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> >>>>>>>>>>>>>> ---
> >>>>>>>>>>>>>>  src/qemu/qemu_driver.c    |  6 +++---
> >>>>>>>>>>>>>>  src/qemu/qemu_saveimage.c | 11 ++++++-----
> >>>>>>>>>>>>>>  src/util/virfile.c        | 12 ++++++++++++
> >>>>>>>>>>>>>>  src/util/virfile.h        |  1 +
> >>>>>>>>>>>>>>  4 files changed, 22 insertions(+), 8 deletions(-)
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Hello, I initially thought this to be a qemu performance issue,
> >>>>>>>>>>>>>> so you can find the discussion about this in qemu-devel:
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> "Re: bad virsh save /dev/null performance (600 MiB/s max)"
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg03142.html
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>> Current results show these experimental averages maximum throughput
> >>>>>>>>> migrating to /dev/null per each FdWrapper Pipe Size (as per QEMU QMP
> >>>>>>>>> "query-migrate", tests repeated 5 times for each).
> >>>>>>>>> VM Size is 60G, most of the memory effectively touched before migration,
> >>>>>>>>> through user application allocating and touching all memory with
> >>>>>>>>> pseudorandom data.
> >>>>>>>>>
> >>>>>>>>> 64K:     5200 Mbps (current situation)
> >>>>>>>>> 128K:    5800 Mbps
> >>>>>>>>> 256K:   20900 Mbps
> >>>>>>>>> 512K:   21600 Mbps
> >>>>>>>>> 1M:     22800 Mbps
> >>>>>>>>> 2M:     22800 Mbps
> >>>>>>>>> 4M:     22400 Mbps
> >>>>>>>>> 8M:     22500 Mbps
> >>>>>>>>> 16M:    22800 Mbps
> >>>>>>>>> 32M:    22900 Mbps
> >>>>>>>>> 64M:    22900 Mbps
> >>>>>>>>> 128M:   22800 Mbps
> >>>>>>>>>
> >>>>>>>>> This above is the throughput out of patched libvirt with multiple Pipe Sizes for the FDWrapper.
> >>>>>>>>
> >>>>>>>> Ok, its bouncing around with noise after 1 MB. So I'd suggest that
> >>>>>>>> libvirt attempt to raise the pipe limit to 1 MB by default, but
> >>>>>>>> not try to go higher.
> >>>>>>>>
> >>>>>>>>> As for the theoretical limit for the libvirt architecture,
> >>>>>>>>> I ran a qemu migration directly issuing the appropriate QMP
> >>>>>>>>> commands, setting the same migration parameters as per libvirt,
> >>>>>>>>> and then migrating to a socket netcatted to /dev/null via
> >>>>>>>>> {"execute": "migrate", "arguments": { "uri", "unix:///tmp/netcat.sock" } } :
> >>>>>>>>>
> >>>>>>>>> QMP:    37000 Mbps
> >>>>>>>>
> >>>>>>>>> So although the Pipe size improves things (in particular the
> >>>>>>>>> large jump is for the 256K size, although 1M seems a very good value),
> >>>>>>>>> there is still a second bottleneck in there somewhere that
> >>>>>>>>> accounts for a loss of ~14200 Mbps in throughput.
> >>>>>>
> >>>>>>
> >>>>>> Interesting addition: I tested quickly on a system with faster cpus and larger VM sizes, up to 200GB,
> >>>>>> and the difference in throughput libvirt vs qemu is basically the same ~14500 Mbps.
> >>>>>>
> >>>>>> ~50000 mbps qemu to netcat socket to /dev/null
> >>>>>> ~35500 mbps virsh save to /dev/null
> >>>>>>
> >>>>>> Seems it is not proportional to cpu speed by the looks of it (not a totally fair comparison because the VM sizes are different).
> >>>>>
> >>>>> It might be closer to RAM or cache bandwidth limited though; for an extra copy.
> >>>>
> >>>> I was thinking about sendfile(2) in iohelper, but that probably
> >>>> can't work as the input fd is a socket, I am getting EINVAL.
> >>>
> >>> Yep, sendfile() requires the input to be a mmapable FD,
> >>> and the output to be a socket.
> >>>
> >>> Try splice() instead  which merely requires 1 end to be a
> >>> pipe, and the other end can be any FD afaik.
> >>>
> >>
> >> I did try splice(), but performance is worse by around 500%.
> > 
> > Hmm, that's certainly unexpected !
> > 
> >> Any ideas welcome,
> > 
> > I learnt there is also a newer  copy_file_range call, not sure if that's
> > any better.
> > 
> > You passed len as 1 MB, I wonder if passing MAXINT is viable ? We just
> > want to copy everything IIRC.
> > 
> > With regards,
> > Daniel
> > 
> 
> Crazy idea, would trying to use the parallel migration concept for migrating to/from a file make any sense?
> 
> Not sure if applying the qemu multifd implementation of this would apply, maybe it could be given another implementation for "toFile", trying to use more than one cpu to do the transfer?

I can't see a way that would help; well, I could if you could
somehow have multiple io helper threads that dealt with it.

Dave

> Thanks,
> 
> Claudio
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


