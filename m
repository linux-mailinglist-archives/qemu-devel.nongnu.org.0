Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11FF567341
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 17:51:16 +0200 (CEST)
Received: from localhost ([::1]:55638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8kpX-0002OP-NO
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 11:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1o8kks-0003Cz-Tm
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:46:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1o8kkr-0000uB-B1
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:46:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657035984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JwovsujzbZmgmP9oP2fwtYAMASJJDYhFMg7gcn5z/Bc=;
 b=DVjdcAFA0hfRGSOeozXGEMeGhA/4o0bJ4Uc72fJp6KRs/oV0JJTjDR2J+rmImcTLBmyn3q
 19geL/X8NBKlminbOFffOpCgE/1PcAHBgMAUe7OD31ZzjQpfSRyNeaqc7u8RpzFsh+XElA
 GasfpvppIJVhOLHmogYaFqzltr2K0ic=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-dxcSc3NtPjSVYzNf6EQupw-1; Tue, 05 Jul 2022 11:46:22 -0400
X-MC-Unique: dxcSc3NtPjSVYzNf6EQupw-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-31c9d560435so36425747b3.21
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 08:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc;
 bh=JwovsujzbZmgmP9oP2fwtYAMASJJDYhFMg7gcn5z/Bc=;
 b=14v81XF6Sn9SP+iNlpFDXD27lvkjtJvP13egApe+gY7Up0b9P3cAVWNxtcfn7LXjfK
 k43Qqg8sJDEKJmwpdCeCJmphYnbdeuAV0vj62s7LMe4MY98TUiMlQNaSQzczsWe2JXc9
 THw1Tg9NXtxj/DZTTkOfByyouLoal5amnRXWm0v1GEZU8jIdz5ZHcSEvUbpR7iRp9L2y
 eLKaO1F9guwfmO0cZLUpI62mMQTt3TRKD4Xucgn5bJ0L9XzF3Bs6EVoi5MAD2QmXWZ0F
 861zz9d4iGbxgCreTNcNfR3Hsi6hDEr3ptG40FXYrIqmSiddsEsRN/JlMvD96zdNrCNF
 G58Q==
X-Gm-Message-State: AJIora8yPNoDJPjRjgPUdY2Ld50vHsWUcmByNG81mJ2OrftBAuu/3i/P
 maPVql6oTaS2cgT/3gyb3EwDX+LhNoE5c1xf1DyJNGA2qCKbpqKYyRiqJ5dMolG2JcTSKfSWF2o
 kNLLK3bRsW/gXrkdRr0szDzwwfr0IegM=
X-Received: by 2002:a81:1090:0:b0:31c:9be5:6c95 with SMTP id
 138-20020a811090000000b0031c9be56c95mr12106540ywq.384.1657035981811; 
 Tue, 05 Jul 2022 08:46:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uqtJBP+23zEnrdiSE9zzRixz/dwVYmL6CrF+iz+xQltRecElhJX48PLv4gVLbQLMROAcslxGjsGUqcpAX8Ckk=
X-Received: by 2002:a81:1090:0:b0:31c:9be5:6c95 with SMTP id
 138-20020a811090000000b0031c9be56c95mr12106519ywq.384.1657035981582; Tue, 05
 Jul 2022 08:46:21 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Jul 2022 08:46:21 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-8-victortoso@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220617121932.249381-8-victortoso@redhat.com>
Date: Tue, 5 Jul 2022 08:46:21 -0700
Message-ID: <CABJz62P5-Dxy5fcb9wh-xo9_EX4K89F+2Pnydayg+T6eAt3pkw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 7/8] qapi: golang: Add CommandResult type to Go
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 17, 2022 at 02:19:31PM +0200, Victor Toso wrote:
> +type EmptyCommandReturn struct {
> +    CommandId string          `json:"id,omitempty"`
> +    Error     *QapiError      `json:"error,omitempty"`
> +    Name      string          `json:"-"`
> +}

Do we need a specific type for this? Can't we just generate an
appropriately-named type for each of the commands that don't return
any data? It's not like we would have to write that code manually :)

> +func (r *EmptyCommandReturn) GetCommandName() string {
> +    return r.Name
> +}

Just like Event.GetName() and Command.GetName(), I'm not convinced we
should have this.


Of course, all the comments about how marshalling and unmarshalling
are handled made for events also apply here.

-- 
Andrea Bolognani / Red Hat / Virtualization


