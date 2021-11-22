Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D404598AD
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 00:54:27 +0100 (CET)
Received: from localhost ([::1]:51318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpJ8k-0007Va-Bi
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 18:54:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mpJ7w-0006q5-BR
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 18:53:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mpJ7t-00056d-50
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 18:53:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637625211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V/iV/mJTlo9XRRLIage1WcUmRhIqLg//1kUheQcJLbo=;
 b=H4s2R17NjgPDbi9oN875hvsJAiZZ6+ESaoSkX2V7o5M8LIFtyT4wN91Kq915yVFP8V7xl9
 jQrzcGbEA0MsqCTo+3ZYf6ChHmE423sfMHXtaelV3dZzuAnjGJyO94ny2mJopHHs6+x3Y6
 EXs1TgfRdmY4KIqH9tnW8PYdJ6Ad/1A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-309-8n4V_Y5xP-yJ0UedJwMCmQ-1; Mon, 22 Nov 2021 18:53:29 -0500
X-MC-Unique: 8n4V_Y5xP-yJ0UedJwMCmQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 o18-20020a05600c511200b00332fa17a02eso676117wms.5
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 15:53:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V/iV/mJTlo9XRRLIage1WcUmRhIqLg//1kUheQcJLbo=;
 b=Q5etfjhs9l4MKVCRuaQ+1HS4b8Q4Ufo6T2weNUTBV+t/wm/bkYtTHT7I+z53h8bg8C
 +/ijQPzSg9swvSsLHi90/dJjGje99Uhpu1Ma85yXDaLmNTWyn5w/LrGWOiNjAZDZ7CdC
 BXEjItdynXxSn3dyTgS5Z51T7drs3G6vxUqRzSzOI5uPB/muMjiB06+ZnoM7n5i19tIm
 h6T5SLqoOEQ6eOfRtpTSagUTtVZsKVFMh3MtTYe6VN/772WN7h/EHo8Y/y3MluaWRaWQ
 ELTLZgMkal33iEVb4+zIwmPgQ4t6RM5LZNRXTpdiXwJ5/ykk5FIU0wCuzFRejV2nR49r
 t/xg==
X-Gm-Message-State: AOAM531gIPSYcuqo6c/Kn0WGz/GXARC4qMF+ZUzrRF0L53/ZoNzX1aE8
 i8U4UGPp3ryK5yUas8ZnvyOGIlEzDFGocg7UHMJRlHcOi5kYaK/Dsy/y94ovbmYYKzTf2aKX66j
 3tCnqokGuQpgGgsg=
X-Received: by 2002:adf:dd0a:: with SMTP id a10mr1701195wrm.60.1637625208830; 
 Mon, 22 Nov 2021 15:53:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1GaRagWp1PLT6PCRJjG+JAjzFpHo9DCJfvpdas8DE+402jUNenMjXYicxZn3D454oxSAhNQ==
X-Received: by 2002:adf:dd0a:: with SMTP id a10mr1701172wrm.60.1637625208644; 
 Mon, 22 Nov 2021 15:53:28 -0800 (PST)
Received: from redhat.com ([45.15.19.36])
 by smtp.gmail.com with ESMTPSA id q26sm10436001wrc.39.2021.11.22.15.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 15:53:27 -0800 (PST)
Date: Mon, 22 Nov 2021 18:53:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] virtio-mem: Don't skip alignment checks when warning
 about block size
Message-ID: <20211122185320-mutt-send-email-mst@kernel.org>
References: <20211011173305.13778-1-david@redhat.com>
 <20211012032705-mutt-send-email-mst@kernel.org>
 <3c54b0ab-85b6-bb86-93f6-ecfd6c63f346@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3c54b0ab-85b6-bb86-93f6-ecfd6c63f346@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 22, 2021 at 01:01:51PM +0100, David Hildenbrand wrote:
> On 12.10.21 09:27, Michael S. Tsirkin wrote:
> > On Mon, Oct 11, 2021 at 07:33:05PM +0200, David Hildenbrand wrote:
> >> If we warn about the block size being smaller than the default, we skip
> >> some alignment checks.
> >>
> >> This can currently only fail on x86-64, when specifying a block size of
> >> 1 MiB, however, we detect the THP size of 2 MiB.
> >>
> >> Fixes: 228957fea3a9 ("virtio-mem: Probe THP size to determine default block size")
> >> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> >> Signed-off-by: David Hildenbrand <david@redhat.com>
> > 
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 
> Thanks Michael, will you send this for the v6.2 release?
> 
> 
> -- 
> Thanks,
> 
> David / dhildenb

sure


