Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B8B5C00C8
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 17:09:20 +0200 (CEST)
Received: from localhost ([::1]:37944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob1Lj-00056i-Sv
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 11:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ob1Ew-0000Fx-0m
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:02:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ob1Et-0006Wa-OR
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663772532;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=SKdVr/5FjzK+IUZ8wIlJwW/YajRW7UneYJ2ejHRCyas=;
 b=XDOhG8wrOTNHl+bA2WdmtL7a2V4yxf4c4ExLsEt8SzXqWWlr93fkspEVIipklekIDKxBeB
 DQyIMZ5ZrpLOtO0asCMPq6FTXizlFRdZxR7hBgesOmNOyeQ8WC96LRmiMzEfMXEJbNSauo
 pCgEpmLCpoV7QillJh2xLCC3M6AETBM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-3AjMAHG3PtylAcVeGybA3Q-1; Wed, 21 Sep 2022 11:02:08 -0400
X-MC-Unique: 3AjMAHG3PtylAcVeGybA3Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3ECE7294EDDB;
 Wed, 21 Sep 2022 15:02:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA60C200E1FA;
 Wed, 21 Sep 2022 15:02:06 +0000 (UTC)
Date: Wed, 21 Sep 2022 16:01:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "Wang, Lei" <lei4.wang@intel.com>, paul.c.lai@intel.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org, robert.hu@intel.com,
 xiaoyao.li@intel.com, chenyi.qiang@intel.com
Subject: Re: [PATCH] i386: Add new CPU model SapphireRapids
Message-ID: <YysnZp+Jxt5wHLI+@redhat.com>
References: <20220812055751.14553-1-lei4.wang@intel.com>
 <Yysk/taT/eKR0Bp3@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yysk/taT/eKR0Bp3@work-vm>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 21, 2022 at 03:51:42PM +0100, Dr. David Alan Gilbert wrote:
> * Wang, Lei (lei4.wang@intel.com) wrote:
> > The new CPU model mostly inherits features from Icelake-Server, while
> > adding new features:
> >  - AMX (Advance Matrix eXtensions)
> >  - Bus Lock Debug Exception
> > and new instructions:
> >  - AVX VNNI (Vector Neural Network Instruction):
> >     - VPDPBUS: Multiply and Add Unsigned and Signed Bytes
> >     - VPDPBUSDS: Multiply and Add Unsigned and Signed Bytes with Saturation
> >     - VPDPWSSD: Multiply and Add Signed Word Integers
> >     - VPDPWSSDS: Multiply and Add Signed Integers with Saturation
> >  - FP16: Replicates existing AVX512 computational SP (FP32) instructions
> >    using FP16 instead of FP32 for ~2X performance gain
> >  - SERIALIZE: Provide software with a simple way to force the processor to
> >    complete all modifications, faster, allowed in all privilege levels and
> >    not causing an unconditional VM exit
> >  - TSX Suspend Load Address Tracking: Allows programmers to choose which
> >    memory accesses do not need to be tracked in the TSX read set
> >  - AVX512_BF16: Vector Neural Network Instructions supporting BFLOAT16
> >    inputs and conversion instructions from IEEE single precision
> > 
> > Features may be added in future versions:
> >  - CET (virtualization support hasn't been merged)
> > Instructions may be added in future versions:
> >  - fast zero-length MOVSB (KVM doesn't support yet)
> >  - fast short STOSB (KVM doesn't support yet)
> >  - fast short CMPSB, SCASB (KVM doesn't support yet)
> > 
> > Signed-off-by: Wang, Lei <lei4.wang@intel.com>
> > Reviewed-by: Robert Hoo <robert.hu@linux.intel.com>
> 
> Hi,
>    What fills in the AMX tile and tmul information leafs
> (0x1D, 0x1E)?
>   In particular, how would we make sure when we migrate between two
> generations of AMX/Tile/Tmul capable devices with different
> register/palette/tmul limits that the migration is tied to the CPU type
> correctly?
>   Would you expect all devices called a 'SappireRapids' to have the same
> sizes?

We shouldn't assume this will only be used on 'SappireRapids' host
silicon. Thi named CPU model is likely to be used by a guest running
on any host silicon generations that follow SappireRapids too.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


