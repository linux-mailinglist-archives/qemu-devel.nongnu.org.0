Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 670674A592F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 10:27:40 +0100 (CET)
Received: from localhost ([::1]:32874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEpRr-00025o-8f
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 04:27:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nEpMi-0007Lf-VV
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 04:22:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nEpMQ-0003ez-NX
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 04:22:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643707254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LeWCPP6D/0SM7z+psLAkkznwApE3Kig0QyY3lgTSF+s=;
 b=AD4Xgr1CIubxgXl0SXs4E7bWxA4jQRCIWVGB+drK/NOTOm3/GIu0JATc6u4y4vJPWk+PY2
 3ZDjxaKF3n9pXeyYN6unFtuK9lp2iU+Ra9/C8eF1thF7W5+iQcACZxfkn+fRdWrKmdfbxX
 TEo0F73JbcvM8hOhr1NjN5SJj9JIedc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-e9jFUKV_OXao2rLmPwAZmQ-1; Tue, 01 Feb 2022 04:20:45 -0500
X-MC-Unique: e9jFUKV_OXao2rLmPwAZmQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 q4-20020adfbb84000000b001dd3cfddb2dso5784286wrg.11
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 01:20:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=LeWCPP6D/0SM7z+psLAkkznwApE3Kig0QyY3lgTSF+s=;
 b=JGNcmHTu5ZEs9y6q4DTx3aKLd4oFcURsgeGvlV+g0PhSOfDuFdn3xFOv5wv9KO9GAE
 vK9T8i8BRPoCMGnSFep/OIcj9igCqgSyL7KL2VPWRKqVNizjzzYjetc5iJoj7b+S4Ohs
 k/l3C12vKV+XDkJqNCNTVLXIVZ1cU228m5NMAmG+GWLaPArS6xI9crZoIqUXZWZ3lW4Q
 i+2OPz6Fou/YJq6dEaEHk/69e1WPaAuueQCuY0F0CU3d9Rxq0u3fIHDOnnS3LrP91KaT
 k/014XoBG8+nsqphGh8P/iB741NWHByA9EKyTPKsamOecAkDQGeJTCRYprMNmUJTEZXA
 qPUA==
X-Gm-Message-State: AOAM530OUfTztH/njVB9XEBH6fcCYDGukIWDSvb8QHEXZCfLoq3yaqrd
 xWNO5q02kojKCUeiLHadYvCHFH5gOVO1qNfBLF7Zlsf2xkvkx/lbkjvw7b1NxLvzJZGWHcNj58+
 s5Q7VXkv/JjIO0vE=
X-Received: by 2002:a05:6000:154a:: with SMTP id
 10mr20620990wry.269.1643707244103; 
 Tue, 01 Feb 2022 01:20:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoKdK/7BtoJWHE385N9jKL5P3GyVPUFw/OwUiknFpOpvgA7QDbnb7YEXLPJFPlSik4Dzq+/w==
X-Received: by 2002:a05:6000:154a:: with SMTP id
 10mr20620962wry.269.1643707243786; 
 Tue, 01 Feb 2022 01:20:43 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id 11sm16769141wrb.30.2022.02.01.01.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 01:20:43 -0800 (PST)
Date: Tue, 1 Feb 2022 09:20:41 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Babu Moger <babu.moger@amd.com>
Subject: Re: [RFC PATCH 1/1] i386: Remove features from Epyc-Milan cpu
Message-ID: <Yfj7adCHwlxJvd95@work-vm>
References: <20220129102336.387460-1-leobras@redhat.com>
 <Yfem3s94EwIxqO1a@redhat.com>
 <CAJ6HWG7RvW6ofKRf7RAK2d8Kw0sOTX7UoYKBBJOy9Yw3yJhZaA@mail.gmail.com>
 <Yfgkdij1x2gSTdXt@redhat.com>
 <CAJ6HWG5uHnG50DPaDEZw1hbpnB3ygXzNA6PaPDT5PiKBYv6b9w@mail.gmail.com>
 <720a5ec2-a954-fbe8-a5f2-0eabce7158c4@amd.com>
MIME-Version: 1.0
In-Reply-To: <720a5ec2-a954-fbe8-a5f2-0eabce7158c4@amd.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Leonardo Bras Soares Passos <leobras@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Babu Moger (babu.moger@amd.com) wrote:
> 
> On 1/31/22 14:18, Leonardo Bras Soares Passos wrote:
> > On Mon, Jan 31, 2022 at 3:04 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >> On Mon, Jan 31, 2022 at 02:56:38PM -0300, Leonardo Bras Soares Passos wrote:
> >>> Hello Daniel,
> >>>
> >>> On Mon, Jan 31, 2022 at 6:08 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >>>> CC'ing  Babu Moger who aded the Milan CPU model.
> >>>>
> >>>> On Sat, Jan 29, 2022 at 07:23:37AM -0300, Leonardo Bras wrote:
> >>>>> While trying to bring a VM with EPYC-Milan cpu on a host with
> >>>>> EPYC-Milan cpu (EPYC 7313), the following warning can be seen:
> >>>>>
> >>>>> qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.07H:EBX.erms [bit 9]
> >>>>> qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.07H:EDX.fsrm [bit 4]
> >>>>>
> >>>>> Even with this warning, the host goes up.
> >>>>>
> >>>>> Then, grep'ing cpuid output on both guest and host, outputs:
> >>>>>
> >>>>> extended feature flags (7):
> >>>>>       enhanced REP MOVSB/STOSB                 = false
> >>>>>       fast short REP MOV                       = false
> >>>>>       (simple synth)  = AMD EPYC (3rd Gen) (Milan B1) [Zen 3], 7nm
> >>>>>    brand = "AMD EPYC 7313 16-Core Processor               "
> >>>>>
> >>>>> This means that for the same -cpu model (EPYC-Milan), the vcpu may or may
> >>>>> not have the above feature bits set, which is usually not a good idea for
> >>>>> live migration:
> >>>>> Migrating from a host with these features to a host without them can
> >>>>> be troublesome for the guest.
> >>>>>
> >>>>> Remove the "optional" features (erms, fsrm) from Epyc-Milan, in order to
> >>>>> avoid possible after-migration guest issues.
> >>>> Babu,  can you give some insight into availability of erms / fsrm
> >>>> features across the EPYC 3rd gen CPU line. Is this example missing
> >>>> erms/fsrm an exception, or common place ?
> 
> AMD supports fsrm and erms in EPYC 3rd gen CPUs. But there is some
> inconsistency in enabling these features in the BIOS. Some BIOSes enable
> it automatically and some BIOSes don't. But there a BIOS option
> (in ADVANCED -> AMD CBS) to enable/disable manually. We are working
> internally to find out the going forward strategy for these features. We
> will update the code when we find out about it.
> 
> We know it is causing little bit of annoyance to the users. But as far as
> we know it should not cause migration issues as already discussed.

Given what Leo and Dan have described it'll probably cause some odd CPU
model usage for us, and possibly failures for customers trying to
migrate between hosts in a farm where the BIOS is configured differently
on the two hosts.

Having said that, these flags are interesting.
If I understand correctly they're just hints to the guest whether to
use rep movsb or not - there's no extra state, no change in semantics -
so in theory if they mismatch it doesn't matter.

Dave

> thanks
> 
> 
> >>>>
> >>>>> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> >>>>> ---
> >>>>>
> >>>>> Does this make sense? Or maybe I am missing something here.
> >>>>>
> >>>>> Having a kvm guest running with a feature bit, while the host
> >>>>> does not support it seems to cause a possible break the guest.
> >>>> The guest won't see the feature bit - that warning message from QEMU
> >>>> is telling you that it did't honour the request to expose
> >>>> erms / fsrm - it has dropped them from the CPUO exposed to the guest.
> >>> Exactly.
> >>> What I meant here is:
> >>> 1 - Host with these feature bits start a VM with EPYC-Milan cpu (and
> >>> thus have those bits enabled)
> >>> 2 - Guest is migrated to a host such as the above, which does not
> >>> support those features (bits disabled), but does support EPYC-Milan
> >>> cpus (without those features).
> >>> 3 - The migration should be allowed, given the same cpu types. Then
> >>> either we have:
> >>> 3a : The guest vcpu stays with the flag enabled (case I tried to
> >>> explain above), possibly crashing if the new feature is used, or
> >>> 3b: The guest vcpu disables the flag due to incompatibility,  which
> >>> may make the guest confuse due to cpu change, and even end up trying
> >>> to use the new feature on the guest, even if it's disabled.
> >> Neither should happen with a correctly written mgmt app in charge.
> >>
> >> When launching a QEMU process for an incoming migration, it is expected
> >> that the mgmt app has first queried QEMU on the source to get the precise
> >> CPU model + flags that were added/removed on the source. The QEMU on
> >> the target is then launched with this exact set of flags, and the
> >> 'check' flag is also set for -cpu. That will cause QEMU on the target
> >> to refuse to start unless it can give the guest the 100% identical
> >> CPUID to what has been requested on the CLI, and thus matching the
> >> source.
> >>
> >> Libvirt will ensure all this is done correctly. If not using libvirt
> >> then you've got a bunch of work to do to achieve this. It certainly
> >> isn't sufficient to merely use the same plain '-cpu' arg that the
> >> soruce was original booted with, unless you have 100% identical
> >> hardware, microcode, and software on both hosts, or the target host
> >> offers a superset of features.
> > Oh, that is very interesting! Thanks for sharing!
> >
> > Well, then at least one unexpected scenario should happen:
> > - VM with EPYC-Milan cpu, created in source host
> > - Source host with EPYC-Milan cpu. Support for 'extra features'
> > enabled ( erms / fsrm in this ex.)
> > - Target host with EPYC-Milan cpu. No support for 'extra features'.
> > Since the VM will be created with support for 'extra features', trying
> > to migrate from source host to target host should fail, right?
> >
> > Which is, IMHO, odd. I imagine questions like:
> > - "How does a host with EPYC-Milan cpu does not offer support to
> > receive a live migration of some VMs with EPYC-Milan cpu?", or even
> > - "If I can create a VM with EPYC-Milan cpu on that host, why can't I
> > receive (via migration) some VMs with EPYC-Milan CPU ?"
> >
> > But I am new to live migration, so maybe I am getting something wrong
> > regarding the cpu-model idea.
> >
> > Best regards,
> > Leo
> >
> >
> >
> >>
> >> Regards,
> >> Daniel
> >> --
> >> |: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fberrange.com%2F&amp;data=04%7C01%7Cbabu.moger%40amd.com%7C4b27f5f24f91458f4c1408d9e4f6d80a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637792571249191260%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=t9LpUFrscExWZXhVkFWYLAuFDn%2FxEdmyFPEFAeSwwn8%3D&amp;reserved=0      -o-    https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.flickr.com%2Fphotos%2Fdberrange&amp;data=04%7C01%7Cbabu.moger%40amd.com%7C4b27f5f24f91458f4c1408d9e4f6d80a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637792571249191260%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=TOhfcLvsf%2BOinXAsEH2pqL%2BUdhR6izv3Y1t5dv6n5Tw%3D&amp;reserved=0 :|
> >> |: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flibvirt.org%2F&amp;data=04%7C01%7Cbabu.moger%40amd.com%7C4b27f5f24f91458f4c1408d9e4f6d80a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637792571249191260%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=V57dTTtEccVO7eUYrjB1CvHrY543bKMyt4R8Z5psgik%3D&amp;reserved=0         -o-            https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Ffstop138.berrange.com%2F&amp;data=04%7C01%7Cbabu.moger%40amd.com%7C4b27f5f24f91458f4c1408d9e4f6d80a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637792571249191260%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=GAkAOUbc0e5yDC92pUkZ50IywidWbZQHaZGUfgO28nI%3D&amp;reserved=0 :|
> >> |: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fentangle-photo.org%2F&amp;data=04%7C01%7Cbabu.moger%40amd.com%7C4b27f5f24f91458f4c1408d9e4f6d80a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637792571249191260%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=x%2FCSGj5ru80b%2B6Gut17epf%2BGh9skGUdiQR6CUuxSdRA%3D&amp;reserved=0    -o-    https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.instagram.com%2Fdberrange&amp;data=04%7C01%7Cbabu.moger%40amd.com%7C4b27f5f24f91458f4c1408d9e4f6d80a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637792571249191260%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=MOmJdAwgSNSz9%2B%2FKo4RD00k0GFdFmldUEeCrKHBFv2c%3D&amp;reserved=0 :|
> >>
> -- 
> Thanks
> Babu Moger
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


