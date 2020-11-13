Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFF42B2386
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 19:17:46 +0100 (CET)
Received: from localhost ([::1]:38516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdddp-0006e4-6a
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 13:17:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kddbf-0005w6-UO
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 13:15:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kddbb-0006bl-2W
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 13:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605291324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zkuEYws9skEAM4A0kZhUVKIsDvXRxOp/J3D74XnGOSs=;
 b=Hpixmy3PLAtFvMTGRjqtFJVcP5SkT304U3aSbd+xzBMHN97NxDmKrf1QJ/8+WVgxVoQBic
 nK6h1slUWZy7CEim+LXUgDHORky7kFyi/GOGnZgTaZuKzIdjQ1KdyB6Q9wepQB3spCJzZl
 SQ4NnOJyyyuRIWtymYTlGdi4Fa5IDU0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-8E7x-CZpMu2bByUX74zHMg-1; Fri, 13 Nov 2020 13:15:23 -0500
X-MC-Unique: 8E7x-CZpMu2bByUX74zHMg-1
Received: by mail-wm1-f71.google.com with SMTP id 3so4334145wms.9
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 10:15:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zkuEYws9skEAM4A0kZhUVKIsDvXRxOp/J3D74XnGOSs=;
 b=MkzwNMsIaWapOXZrdKcPvNjqjjJfPava8haa/+gSzxGTrsBIBNPjf6J0eS9E6X3jOz
 Tfng1E73z8UQel9jUv0jbBmI1pT0T/xYR3JV5ljFpVXd7C5j/M8o5lpaw+brUjE60eHk
 TyKPw779RSpNY7dMIvhq2oMHOLbBQu3+iO+EfetmBMkr8Ggg47k3Xf7lhgQTXJcFtqCt
 U+SA8CUajnHqSvHGEpsUCwU6aPycDFXgmoBpkp14tyOgthpR8dCscGaEtmLMys5Qi8lV
 XHgFRaDqME2UKcE3sXabjdih+JsrfxbBol4L3Ze9HNQ81eZQzWxwVRMr7jg7rvF1BA6g
 Vzsw==
X-Gm-Message-State: AOAM533IILFsYHOuWFzMZI32nDTJMFpMcXSr/pvkFClJw7sMpSmut9/M
 p6fpjDBqdzTS/JqDvd2pLXyyr61g2LlemLqqdCvuKUxNW+jMRXggyh8jtEAQ5sakf2DzKcjUTOg
 GcTsS4enmKhSy6CyfRQb1xOSrQ4zuAaIfn2+ws/IciKtQVI3UJ1drFp2F5qkGiX/eayI=
X-Received: by 2002:a05:6000:1050:: with SMTP id
 c16mr5141570wrx.400.1605291318253; 
 Fri, 13 Nov 2020 10:15:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFQisc0NmmHvAGSPMvXVXkGdNCaoRxPj4OVnzX2JjPrGECSwSixQHUhD1n1bqoemFvu3GQKQ==
X-Received: by 2002:a05:6000:1050:: with SMTP id
 c16mr5141517wrx.400.1605291317732; 
 Fri, 13 Nov 2020 10:15:17 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y63sm10613928wmg.28.2020.11.13.10.15.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 10:15:16 -0800 (PST)
To: Hannes Reinecke <hare@suse.de>, qemu-devel@nongnu.org
References: <20201112095220.52590-1-pbonzini@redhat.com>
 <8c23f562-44aa-2cac-eabb-5eb6c2486d45@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] scsi-disk: convert more errno values back to SCSI statuses
Message-ID: <6f49b3e9-7a6d-6263-647e-343351e8678a@redhat.com>
Date: Fri, 13 Nov 2020 19:15:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <8c23f562-44aa-2cac-eabb-5eb6c2486d45@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 16:04, Hannes Reinecke wrote:
> On 11/12/20 10:52 AM, Paolo Bonzini wrote:
> Well, ironically I'm currently debugging a customer escalation which 
> touches exactly this area. It revolves more around the SG_IO handling;

Technically this patch is for *non* passthrough, but yeah it's a similar 
case.

> qemu ignores the host_status setting completely, leading to data
> corruption if the host has to abort commands. (Not that the host
> _does_ abort commands, as qemu SG_IO sets an infinite timeout. But
> that's another story).

> And part of the patchset is to enable passing of the host_status code 
> back to the drivers. In particular virtio_scsi has a 'response' code 
> which matches pretty closely to the linux SCSI DID_XXX codes.

Yeah, most of the time that's just because it's what can go wrong in 
SCSI.  Sometimes it's because I had no clue when writing the virtio-scsi 
spec and just copied blindly from Linux.  For example 
VIRTIO_SCSI_S_NEXUS_FAILURE probably should have never existed, since 
DID_NEXUS_FAILURE really should have been DID_RESRVATION_CONFLICT.

As an aside, I hate Linux host_status.  It's never clear when looking at 
the code if the statuses have been mapped back to BLK_STS codes or not, 
so you don't know if you already have gotten rid of DID_TARGET_FAILURE, 
DID_NEXUS_FAILURE, DID_ALLOC_FAILURE and DID_MEDIUM_ERROR (which are 
just weird way to store the SCSI status or sense key for future use, and 
not really "host statuses), and would really be a nexus failure only in 
the rare case of path-specific reservations).

> So my idea is to pass the host_status directly down to the drivers, 
> allowing virtio-scsi to do a mapping between DID_XX and virtio response 
> codes.

But yeah, this is a good idea.  But since I hate host_status, please 
define your own enum instead of DID_*.  Of course you can use the same 
values as DID_* and assert with QEMU_BUILD_BUG_ON that they are the 
same, but I don't want people to read the code and have to think of 
DID_ALLOC_FAILURE and the like.

Paolo


