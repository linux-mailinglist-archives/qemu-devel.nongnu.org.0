Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B13351AA51
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 19:21:21 +0200 (CEST)
Received: from localhost ([::1]:32992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmIgg-00022G-04
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 13:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nmIfN-0000ct-If
 for qemu-devel@nongnu.org; Wed, 04 May 2022 13:19:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nmIfK-0008Ck-Qg
 for qemu-devel@nongnu.org; Wed, 04 May 2022 13:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651684791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XUx81F93oNc2rrQWMl1U0oFjPsCmhrKF1pGEcW2KZHo=;
 b=T+ywPkE2T3tA1Y0FHtiH61fxh7b3Cnn0G+MeTRKnfkHgO4czt8tj0UROrA1t3Jse0xfJy1
 MUsWKzSos3dxrC4cFkO7G0t7VqA1jHn8NrkFqZlG/Xf+jQpLq1zmonxJpHe1LZ4JbM2G1p
 7GNCd9CUVvu9bsNtGQvb0Lv4ohA0dNQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-uKsz3CZCM-qI8-T1IO3iHw-1; Wed, 04 May 2022 13:19:50 -0400
X-MC-Unique: uKsz3CZCM-qI8-T1IO3iHw-1
Received: by mail-ed1-f69.google.com with SMTP id
 cf16-20020a0564020b9000b00425d543c75dso1133355edb.11
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 10:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XUx81F93oNc2rrQWMl1U0oFjPsCmhrKF1pGEcW2KZHo=;
 b=Pn3NPh22rvs30zFyI9wWZxNZL7jsW5sUCaIzPkCn4FqNTmqZe5/VcrtDKo8+nPi7sa
 5hz3woMdQxYzAGIR2Kita+VxI8OG1FNiVpGed9f3HU1Im/0NNrbNlPRl3icwhhQh45+b
 2ptjarO1Bw0YvgrDkL/rrYvhxRKsMLblW1Dvvi/d3U4aiUi+Py9zeawI+cy6P1hV3VkA
 0Mt95v/L0+QeC4VD269lbQwmqyZ4Q81IYP6je7nDYcOFGeREz1p2/z7CG8K4cuMnWu3R
 TPLUcDwgcHLYbOnqAEwbmiGuET+9+ncZgAWyeftzBkV+cev4oQwGjkV6Gzk5+EluNvfd
 cy4g==
X-Gm-Message-State: AOAM530BD3ee3MYlsBTfwbaXR0EB2Kr4+MlN8z3AxRRHdoVyGGdhbD+S
 uyu6AHao4orO96pE+NmuHnPQLRw2+qL8PZ264+8Xe2Wqtyq++aTkSJiY+OVoF0Tr8SJ6r4OkN7j
 y+N8zZMgZqdKPI9f/RV/XSa5o6yaKybY=
X-Received: by 2002:a17:906:99c3:b0:6f4:a9d7:6dac with SMTP id
 s3-20020a17090699c300b006f4a9d76dacmr6190513ejn.85.1651684788892; 
 Wed, 04 May 2022 10:19:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwg2u8OHNxg8e7ChkWT0mfoMoOkSQNyVe2w2EvhB3yXddkj1rnrTNwRdqbCGfk5txGsxqX9ibUtPzN3pn+DsUU=
X-Received: by 2002:a17:906:99c3:b0:6f4:a9d7:6dac with SMTP id
 s3-20020a17090699c300b006f4a9d76dacmr6190492ejn.85.1651684788669; Wed, 04 May
 2022 10:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220425215055.611825-1-leobras@redhat.com>
 <20220425215055.611825-4-leobras@redhat.com>
 <87mtfx7eui.fsf@pond.sub.org>
In-Reply-To: <87mtfx7eui.fsf@pond.sub.org>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 4 May 2022 14:19:37 -0300
Message-ID: <CAJ6HWG5YdqFDZXBUrPRXUmoigErYb6kqpO6M+VKMAjHnFVHaQg@mail.gmail.com>
Subject: Re: [PATCH v9 3/7] migration: Add zero-copy-send parameter for
 QMP/HMP for Linux
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, May 4, 2022 at 7:48 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> Leonardo Bras <leobras@redhat.com> writes:
>
> > Add property that allows zero-copy migration of memory pages
> > on the sending side, and also includes a helper function
> > migrate_use_zero_copy_send() to check if it's enabled.
> >
> > No code is introduced to actually do the migration, but it allow
> > future implementations to enable/disable this feature.
> >
> > On non-Linux builds this parameter is compiled-out.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > Reviewed-by: Peter Xu <peterx@redhat.com>
> > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > Reviewed-by: Juan Quintela <quintela@redhat.com>
> > ---
> >  qapi/migration.json   | 24 ++++++++++++++++++++++++
> >  migration/migration.h |  5 +++++
> >  migration/migration.c | 32 ++++++++++++++++++++++++++++++++
> >  migration/socket.c    | 11 +++++++++--
> >  monitor/hmp-cmds.c    |  6 ++++++
> >  5 files changed, 76 insertions(+), 2 deletions(-)
> >
> > diff --git a/qapi/migration.json b/qapi/migration.json
> > index 409eb086a2..04246481ce 100644
> > --- a/qapi/migration.json
> > +++ b/qapi/migration.json
> > @@ -741,6 +741,13 @@
> >  #                      will consume more CPU.
> >  #                      Defaults to 1. (Since 5.0)
> >  #
> > +# @zero-copy-send: Controls behavior on sending memory pages on migrat=
ion.
> > +#                  When true, enables a zero-copy mechanism for sendin=
g memory
> > +#                  pages, if host supports it.
> > +#                  Requires that QEMU be permitted to use locked memor=
y for guest
> > +#                  RAM pages.
>
> Please wrap lines around column 75.  More of the same below.
>
> > +#                  Defaults to false. (Since 7.1)
> > +#
> >  # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
> >  #                        aliases for the purpose of dirty bitmap migra=
tion.  Such
> >  #                        aliases may for example be the corresponding =
names on the
>
> With that, QAPI schema
> Acked-by: Markus Armbruster <armbru@redhat.com>

Thanks Markus!

Best regards,
Leo

>
> [...]
>


