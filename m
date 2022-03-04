Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728234CD2A9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:43:16 +0100 (CET)
Received: from localhost ([::1]:45296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5P1-0000k8-Hc
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:43:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ5LQ-00066Y-Fu
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:39:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ5LO-0002fc-WF
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:39:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646390370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k/BkquDVeqK5TyZdFhR4Flkh/V+oGjDBfehYx7XejjQ=;
 b=Dwn7vbIJNPoDrOSV6bfbZsWdHFe+b9LftLaAkyHGxUROFXA80myKPSVKBqCz6APkMYOPoL
 GMsK6jY4t7Bl05ULhnZvCAEVr2+3mvGXuAgv2F5XdSZTfo+ZUukAodwGVkY5s1H3tIyFzA
 gPsILTTTsePoXyWDEpJUNbpvMM5vxnc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-djNMFHJyNrqKHX5yjpeyTQ-1; Fri, 04 Mar 2022 05:39:29 -0500
X-MC-Unique: djNMFHJyNrqKHX5yjpeyTQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 o1-20020adfe801000000b001f023455317so3222642wrm.3
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 02:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=k/BkquDVeqK5TyZdFhR4Flkh/V+oGjDBfehYx7XejjQ=;
 b=ttaE6ph48nXIPBfcod877E8Ax6WPH+ii05gPNp6Vd3yUp8Xb8HsuF7WEMUM4lqrRIs
 wDh0DLsc81ntYVw2cJ68GJLIWT4u6XIJHEO0mQgXssv0NPfDFamB9BS37HUpRY25CVCc
 LVFmT6axXIWVHQ88oJjxXpFdTo7yoxHvi3MpV8I7NvYzdG+ONsfpYcaGcHA2RDcwV+iX
 KLbNyddfErcYE6hLbRuSGPgXqmmvHmZDZ/cv6LmDzSQe7ZrJTYV1UJfs51LV+Si1u0Uc
 b7VoVQ4BGeKybw9w3LlzPZOHoDJjfreifmXcT+2Mr8vMsXZi7W9wyYIjHERX2zk/RkXO
 FWFg==
X-Gm-Message-State: AOAM5333Gmri357FJruK3JxLAeN7Ulu9LRCypxKYt7Ig1NNSWThxg+D7
 8SB1x8KiWDgy/7Z4uXERNmexkEeRD8RrZnRzkSO5jmc7J/3u7Zi4KHhIOurtltdHCCi9Td/3/ua
 ymTCT7rwY1P4Ju1U=
X-Received: by 2002:adf:cd02:0:b0:1f0:767d:b39a with SMTP id
 w2-20020adfcd02000000b001f0767db39amr1776581wrm.529.1646390368253; 
 Fri, 04 Mar 2022 02:39:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxT4uPmEHDLLNvUc2P3FvMZc3EvNWZHlPA0IIoUa9dbBaOhHU0ZFWGlKHuyUqjn2NU4uzC9kA==
X-Received: by 2002:adf:cd02:0:b0:1f0:767d:b39a with SMTP id
 w2-20020adfcd02000000b001f0767db39amr1776570wrm.529.1646390368011; 
 Fri, 04 Mar 2022 02:39:28 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c358500b0038167e239a2sm5172316wmq.19.2022.03.04.02.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 02:39:27 -0800 (PST)
Date: Fri, 4 Mar 2022 05:39:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v4 0/3] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
Message-ID: <20220304053858-mutt-send-email-mst@kernel.org>
References: <20220228201733.714580-1-liavalb@gmail.com>
 <20220304052617-mutt-send-email-mst@kernel.org>
 <CAARzgwwRC4WQNRV6MKtoCJ+5irhs-zYfvto2Wq63p0BtZoc6GA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAARzgwwRC4WQNRV6MKtoCJ+5irhs-zYfvto2Wq63p0BtZoc6GA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: imammedo@redhat.com, shentey@gmail.com, Liav Albani <liavalb@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 04, 2022 at 04:04:13PM +0530, Ani Sinha wrote:
> On Fri, Mar 4, 2022 at 3:56 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Feb 28, 2022 at 10:17:30PM +0200, Liav Albani wrote:
> > > This can allow the guest OS to determine more easily if i8042 controller
> > > is present in the system or not, so it doesn't need to do probing of the
> > > controller, but just initialize it immediately, before enumerating the
> > > ACPI AML namespace.
> > >
> > > To allow "flexible" indication, I don't hardcode the bit at location 1
> > > as on in the IA-PC boot flags, but try to search for i8042 on the ISA
> > > bus to verify it exists in the system.
> > >
> > > Why this is useful you might ask - this patch allows the guest OS to
> > > probe and use the i8042 controller without decoding the ACPI AML blob
> > > at all. For example, as a developer of the SerenityOS kernel, I might
> > > want to allow people to not try to decode the ACPI AML namespace (for
> > > now, we still don't support ACPI AML as it's a work in progress), but
> > > still to not probe for the i8042 but just use it after looking in the
> > > IA-PC boot flags in the ACPI FADT table.
> >
> > OK still waiting for v5.
> 
> Since the time is tight, I could quickly make the changes in patch 2
> and send it over.

Sure.

> I believe 8th is the last date for new changes.

Yes.

-- 
MST


