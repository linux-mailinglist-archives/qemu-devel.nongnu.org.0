Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0E34ACFEE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 04:54:56 +0100 (CET)
Received: from localhost ([::1]:54112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHHag-0004pw-Vm
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 22:54:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nHHXX-00048U-GB
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 22:51:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nHHXV-0005Dr-6p
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 22:51:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644292295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vEVmMZIR8b5a9T+jKfxW58HFRZWMz0/jT5YTT2cqK20=;
 b=MGY75EdJcVi6Uva7igfKIP9yI27PhdL72/yrCGDikV3Bvyl7Pi6OIwgzBJmOlG7gIc7uWP
 jma6VWuAFdFIq5Ryn2CXmcwTve/nPxPybx7riYQwvncsXh5UHPkwtTrQD+3b/KW1mggme/
 Dsm5NqoLHAhdFSj2sXOzghPvfAWhys0=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-VhJoN722P4O7W6pBl58Sjg-1; Mon, 07 Feb 2022 22:51:34 -0500
X-MC-Unique: VhJoN722P4O7W6pBl58Sjg-1
Received: by mail-pj1-f70.google.com with SMTP id
 w18-20020a17090a461200b001b7ea83e29dso1016621pjg.4
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 19:51:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vEVmMZIR8b5a9T+jKfxW58HFRZWMz0/jT5YTT2cqK20=;
 b=tHyw/KOwi9HDOqA2LOTI4U1qdzJ49aBeABeTxc8b+zqeoqRmm0XEBCaAbgiF6mFBnQ
 kfqyt50Y8AkYZaChR5cmaCymoQ3SFwfE+UB08C5dZpdCjiqSoSN3d9jEypd//uGTkbYF
 5AzchHVI46VrvA8U+9RtRl7pTkIqbKqRD53Ipbr3Fn7jwg8MYeYi2DvjKK+Vzr4BPqVf
 1esuEkHirZjx+CXTGJInKILgUxMOw4N6isZlTCzcZBgnnCX3yTBxGuCxpdTAd9575ANv
 zOKnGzfDatvFwCs8xKKrBFCTaX9Nag4KTWsDc5mcnUkodPcP4UoXNpgDc8n+K0Hk3cPt
 WW6w==
X-Gm-Message-State: AOAM532QQAd8CScoOOvo7ix5ueUP/IZ6rkvfLsoAIIIxEE4lTBgl47g5
 qV5TwxmNXSvJ7eOwHD9hVPIC6OMv/oa0u7BQm1omopQehSHGRsHsUFCRBet93MZenZ4fqNz0r0J
 2yeSM42KawAcoEw4=
X-Received: by 2002:a17:90a:f0d4:: with SMTP id
 fa20mr2297164pjb.1.1644292293207; 
 Mon, 07 Feb 2022 19:51:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzk4mXbCBKKgCAEFzPMkoRGDUB2+kV8444FQ6f7QpuqbOssLhwpfL2FDl3KvqXsykRfra138g==
X-Received: by 2002:a17:90a:f0d4:: with SMTP id
 fa20mr2297156pjb.1.1644292292946; 
 Mon, 07 Feb 2022 19:51:32 -0800 (PST)
Received: from xz-m1.local ([94.177.118.121])
 by smtp.gmail.com with ESMTPSA id l8sm14115677pfc.187.2022.02.07.19.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 19:51:32 -0800 (PST)
Date: Tue, 8 Feb 2022 11:51:27 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 10/15] migration: Move static var in
 ram_block_from_stream() into global
Message-ID: <YgHov2Z00SKI9TO0@xz-m1.local>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-11-peterx@redhat.com>
 <YfwVbwmjyoRL0B72@work-vm>
MIME-Version: 1.0
In-Reply-To: <YfwVbwmjyoRL0B72@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 03, 2022 at 05:48:31PM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > Static variable is very unfriendly to threading of ram_block_from_stream().
> > Move it into MigrationIncomingState.
> > 
> > Make the incoming state pointer to be passed over to ram_block_from_stream() on
> > both caller sites.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> OK, but I'm not sure if I noticed where you changed this to be per
> channel later?

It's done in the last patch where it'll start to pass over "channel" index into
ram_block_from_stream():

static inline RAMBlock *ram_block_from_stream(MigrationIncomingState *mis,
                                              QEMUFile *f, int flags,
                                              int channel)
{
    RAMBlock *block = mis->last_recv_block[channel];
    ...
}

I could have moved it into the new PostcopyTmpPage structure, but it'll be a
bit weird because precopy also uses this to cache the block info, hence I made
it an array.

> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks,

-- 
Peter Xu


