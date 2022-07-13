Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D448572A40
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 02:35:49 +0200 (CEST)
Received: from localhost ([::1]:57242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBQLz-0007Gc-Tg
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 20:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1oBQKK-0005sO-Id
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 20:34:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1oBQKG-0002FQ-Kp
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 20:34:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657672438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wv1i1crVDrM8N5ETRLFAIWzll4VEBjPjhBz+ZTVUqFg=;
 b=AFiFRdcvEjtiWR0F0duv19YRZoKQhtExre30X5StXD+BgurL+2yB31AMuKbCOALC5nOCRw
 /Jlu+bJ2mDWQYoLt+8bGqZpA+wCUS0ApIqbWHh93ktDTDsf3z/33M5/MKLqiYBA8av+DgC
 CucLkterBv9UEjKhLdg0dv68qjElg/g=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-54FR_vPiP6ikS1eSoNAgtg-1; Tue, 12 Jul 2022 20:33:51 -0400
X-MC-Unique: 54FR_vPiP6ikS1eSoNAgtg-1
Received: by mail-ed1-f71.google.com with SMTP id
 f9-20020a056402354900b0043a902b7452so7172487edd.13
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 17:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wv1i1crVDrM8N5ETRLFAIWzll4VEBjPjhBz+ZTVUqFg=;
 b=OvSp+dxJmkL4WzMmczgyeKZ2CMvOliRBjlcTi5XyLP88P/IaqblV6p3dTA/Vu32hZf
 RXy5dmguJphcWbABUy/ShIKEKHX58QiLkrfrvYwNYhACzJMteEvW3O4nyq/f7Tgvwm9r
 yDxeqn0ZOEE8HQWOQenA6cW4upuZMYjRjPt5I3xhTCFMy7Vl+XVeKob0IW/5M2lGT2cf
 +wWrZZTVC6BDukJA9za3D3GY0973PCpte3CI0HZHXr0hBX00sDgAo1I62/SMBuQ/mefC
 SmTWB/zK+DhkDMxT/F3xPndRSoLt0oWKKg7iiIMWMDwpmDBFnZPkOUxEe+ZaapdsCx3L
 GlDQ==
X-Gm-Message-State: AJIora/gM4RbOD8nci1mXhqK+sZAupOBPBhUthzPAMgHDyQUwJcEbCdj
 bEr4z2kxqR8PhHhh7xpZA1o8gH0m8ZxODICfoDb9CnoRUvg6MQh3faYQ2Q5wxmeTg+SqCW71T64
 YeDMqWWoeqCh3kpxsI/YcJXwgvr8wILA=
X-Received: by 2002:aa7:d9ce:0:b0:43a:6758:7652 with SMTP id
 v14-20020aa7d9ce000000b0043a67587652mr1093176eds.351.1657672429902; 
 Tue, 12 Jul 2022 17:33:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sUi1CmjiVwk9mUO21yc5aUDTz2p/uXWs91H5oBUMQxjY3doDQ5gqqKH3paqrGCx098Z8QAIjpsUiuiSr2h5iw=
X-Received: by 2002:aa7:d9ce:0:b0:43a:6758:7652 with SMTP id
 v14-20020aa7d9ce000000b0043a67587652mr1093155eds.351.1657672429712; Tue, 12
 Jul 2022 17:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220711211112.18951-1-leobras@redhat.com>
 <20220711211112.18951-4-leobras@redhat.com>
 <Ys342AjeLqyR5LUr@xz-m1.local>
In-Reply-To: <Ys342AjeLqyR5LUr@xz-m1.local>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 12 Jul 2022 21:33:38 -0300
Message-ID: <CAJ6HWG4mryah9kPmWQC-v-mgUsO2m93NLj8Gjj0Dz++i75nKVg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] migration/multifd: Report to user when zerocopy
 not working
To: Peter Xu <peterx@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 12, 2022 at 7:42 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Mon, Jul 11, 2022 at 06:11:13PM -0300, Leonardo Bras wrote:
> > Some errors, like the lack of Scatter-Gather support by the network
> > interface(NETIF_F_SG) may cause sendmsg(...,MSG_ZEROCOPY) to fail on us=
ing
> > zero-copy, which causes it to fall back to the default copying mechanis=
m.
> >
> > After each full dirty-bitmap scan there should be a zero-copy flush
> > happening, which checks for errors each of the previous calls to
> > sendmsg(...,MSG_ZEROCOPY). If all of them failed to use zero-copy, then
> > increment dirty_sync_missed_zero_copy migration stat to let the user kn=
ow
> > about it.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
> Acked-by: Peter Xu <peterx@redhat.com>

Thanks Peter!

> --
> Peter Xu
>


