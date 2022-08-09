Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B7D58D8E8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 14:49:32 +0200 (CEST)
Received: from localhost ([::1]:37210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLOfr-0006lG-7S
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 08:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oLOcC-0004jt-MV
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 08:45:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oLOc8-0000qg-Pr
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 08:45:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660049137;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=FuLz25zKoqskCYXb5sRtHb8ZE3S2lV4cXj5D6wf1kOg=;
 b=Cbhn0tjifWyX3wJGC+Exj1gDcP2tW7hrPrnzcDVr5zhzQDY6GJcp1ntPoII+iecxlc9vL2
 qXtlZ3lW2CGnvNcaFE1GWQtoQovPS/ugB6JsZI9kzyVMY4DXHoczNfCXnCXCgZSob5zVAA
 /7VAytVUEfSqyYmBbdi1Zk5OWPtexaY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-9Nz2h3-HO2mTCL7sycttCA-1; Tue, 09 Aug 2022 08:45:36 -0400
X-MC-Unique: 9Nz2h3-HO2mTCL7sycttCA-1
Received: by mail-wr1-f72.google.com with SMTP id
 c7-20020adfc6c7000000b0021db3d6961bso1841282wrh.23
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 05:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=FuLz25zKoqskCYXb5sRtHb8ZE3S2lV4cXj5D6wf1kOg=;
 b=FwdDeABW7Otyj9DZSIk52R59uwT0a9QMDRACPDrJ/lV/qS0K/ybfuHhHx39XAOmK1D
 A4dc0OFFpWSOQnhxJ+nAFdQ2P7jzsqNonyHjwdLbCbg0JO3ef0eFsohhkr9t69GvYS2E
 sTc7RuUtAC8QqLG9KtbDsGI/unRzNim1DnJgX1ghIOZaaGudtzI3kUtwG5cIYwaQCODm
 Lko89mzCw7zVxnTmvHamWVVbrzgLAyGKvaBGjGJZZz+jzRkz8VjQjl/RnO2cS3VwMffM
 4Cy3Cgd7A3vxEHAaaSpfn8RWkv/JaXGUBk30W/QBP2Ledi7Lu2LyRPLEsfK2VFaVxCBR
 4jNg==
X-Gm-Message-State: ACgBeo2X90MUt6TsWtTpt5pzAuLCIkLEcljlWjB7S95LGbBrfpI8RbBz
 hGpccOklyfNYB8/vF08pprfOYUOPswW5JBpSWtkasntGIY1A41ytgquIT/qDCf6eEwc4qhhfP+S
 kUHRfIjZ8dp9L9iM=
X-Received: by 2002:a1c:f710:0:b0:394:1960:e8a1 with SMTP id
 v16-20020a1cf710000000b003941960e8a1mr16009631wmh.154.1660049135019; 
 Tue, 09 Aug 2022 05:45:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4Zo45btXvwqkLmtLNyUO2prb0k0JxPsO9+CVo3P3KirEFGYti02YLqsG/lips0iMTS8JOlZQ==
X-Received: by 2002:a1c:f710:0:b0:394:1960:e8a1 with SMTP id
 v16-20020a1cf710000000b003941960e8a1mr16009621wmh.154.1660049134839; 
 Tue, 09 Aug 2022 05:45:34 -0700 (PDT)
Received: from localhost (static-205-204-7-89.ipcom.comunitel.net.
 [89.7.204.205]) by smtp.gmail.com with ESMTPSA id
 bg21-20020a05600c3c9500b003a4efb794d7sm19268217wmb.36.2022.08.09.05.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 05:45:34 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>
Cc: qemu-devel@nongnu.org
Subject: Re: KVM call for 2022-08-09
In-Reply-To: <87k07scn8d.fsf@secure.mitica> (Juan Quintela's message of "Mon, 
 01 Aug 2022 11:44:02 +0200")
References: <87k07scn8d.fsf@secure.mitica>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Tue, 09 Aug 2022 14:45:33 +0200
Message-ID: <87mtcdk2ky.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Juan Quintela <quintela@redhat.com> wrote:
> Hi
>
> Please, send any topic that you are interested in covering.
>
> At the end of Monday I will send an email with the agenda or the
> cancellation of the call, so hurry up.
>
> After discussions on the QEMU Summit, we are going to have always open a
> KVM call where you can add topics.
>
>  Call details:
>
> By popular demand, a google calendar public entry with it
>
>   https://www.google.com/calendar/embed?src=dG9iMXRqcXAzN3Y4ZXZwNzRoMHE4a3BqcXNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ
>
> (Let me know if you have any problems with the calendar entry.  I just
> gave up about getting right at the same time CEST, CET, EDT and DST).
>
> If you need phone number details,  contact me privately
>
> Thanks, Juan.

Today there is a topic for the call:

I'd like to talk about VFIO live migration and more specifically this
issue [1].


[1]
https://lore.kernel.org/all/39f6d299-96c8-9e8c-dcbc-0e4873fd225f@nvidia.com/

See you in 15 mins,


