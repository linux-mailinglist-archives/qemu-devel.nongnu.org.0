Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEBE2D3F51
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:58:53 +0100 (CET)
Received: from localhost ([::1]:52282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwFH-0007Q7-PN
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:58:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <li.zhang@cloud.ionos.com>)
 id 1kmwCY-0004z9-6B
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:56:02 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:44407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <li.zhang@cloud.ionos.com>)
 id 1kmwCV-0001Lc-N1
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:56:01 -0500
Received: by mail-ej1-x641.google.com with SMTP id m19so1182585ejj.11
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 01:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=axb5jmUU3Jat/geQZyecNCMBsyp/o7Mvg3p4dWdeyEM=;
 b=cQlc/glMSAP+FK4CHfSe46yrJTF++Bto9ylwD0EEeUhAT79JyiGmS3nAyDL0aMefNb
 PcLnQSOb/0/9v/Hs14T8aDrI3zdzEUpctY3PoxheZkEEe/xnp+r+V6xKBzYho+ENIrZl
 L8PZUWdSnBJ8toFNES+1NwAT7QeTVBPBqfIxR2nBAKQ2rb16vCU66ymFbASFIT2z+KP7
 IFFU8AOwa5FfELjMLatdr8h//BzHv66rXJG1fsE+Ge++XjyHCMpQYeFOl2C21QEoI799
 3z12adoNB3CxHJIl7Pc9tSn73KuIA9W1sYGu8V6DiHag5vgh2npxwr8fRAQ74JdXWj1y
 Gpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=axb5jmUU3Jat/geQZyecNCMBsyp/o7Mvg3p4dWdeyEM=;
 b=g9VREADM6IiYogpC06LQE+wJMqQbCm7j3Hdp0LJL/wIzmBgHYX31GJ71oF9kNqDLom
 ioxNCbUm6fsQ3G5D4iIMHbG8a4PfmFcvDN7lsmSaIVLbJXQN1Leycq26wt3UpO2bi8ni
 TIetKYZ3N3JfohTzg/4Yz1P03BKt1jkgPryRxb8N9wwcIzyWpxrpoQTKkwIG9QTOdc/e
 IiWt0dVyacgf956p7TMy7nt7xpS75y+l1GgBIoRiTknSRnwNyFCi0UOk/vWByMPaJjgV
 UReFEDFMs6mtD+4U0BnaBEypYIRjmWku67WfrL4oGNrdv0/5BDb7Rn7g5VsevqS0ikUq
 tYxw==
X-Gm-Message-State: AOAM532AlPmcLG1rTYdBJzxDGacF9TRR3OHo/plbJCPPV7Xyye7cVNp0
 23w70ikAz9h4yLjcCTt+ROMcOnqiQIkSboHVv/KkvA==
X-Google-Smtp-Source: ABdhPJzPSY6I5e3AlU6OAkc0meJ/y3cipZF0Qe2QqZe9jqyzdFwlUPVARXIPBlOA764iobT7lnnw7CyaC++H8znv/zE=
X-Received: by 2002:a17:906:f85:: with SMTP id
 q5mr1342117ejj.105.1607507757531; 
 Wed, 09 Dec 2020 01:55:57 -0800 (PST)
MIME-Version: 1.0
References: <20201209072029.2338351-1-li.zhang@cloud.ionos.com>
 <cunim9bs577.fsf@zarquon.hh.sledj.net>
In-Reply-To: <cunim9bs577.fsf@zarquon.hh.sledj.net>
From: Li Zhang <li.zhang@cloud.ionos.com>
Date: Wed, 9 Dec 2020 17:55:43 +0800
Message-ID: <CAEM4iGFiurQLvtKozxukD5S55iAbibNjVWuUZLqSB0PWuJV-Cg@mail.gmail.com>
Subject: Re: [PATCH 1/1] Avoid migration if guest is in postmigrated status
To: David Edmondson <dme@dme.org>
Content-Type: multipart/alternative; boundary="000000000000dca30d05b6051077"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=li.zhang@cloud.ionos.com; helo=mail-ej1-x641.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Li Zhang <zhlcindy@gmail.com>, qemu-devel@nongnu.org, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000dca30d05b6051077
Content-Type: text/plain; charset="UTF-8"

Thanks for telling me that. I didn't notice this patch.
I just caught this error when I used it and read the source code, it should
be fixed.

Thanks
Li

On Wed, Dec 9, 2020 at 5:23 PM David Edmondson <dme@dme.org> wrote:

> On Wednesday, 2020-12-09 at 07:20:29 GMT, Li Zhang wrote:
>
> > This patch is to avoid executing migrations twice, which causes
> > coredump. After the migration has been completed, guest is in
> postmigrated
> > status on source host and the block device is inactive. If executing
> > migration again, it will cause coredump and a block error. For exmaple,
> > executing #migrate "exec:cat>file" twice on source host, block error:
> > bdrv_inactivate_recurse: Assertion `!(bs->open_flags & BDRV_O_INACTIVE)'
> failed
> >
> > Signed-off-by: Li Zhang <li.zhang@cloud.ionos.com>
>
> There is an existing proposal for this (the same approach) in
> https://lore.kernel.org/r/6b704294ad2e405781c38fb38d68c744@h3c.com.
>
> > ---
> >  migration/migration.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/migration/migration.c b/migration/migration.c
> > index 87a9b59f83..113f7e1e41 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -2115,6 +2115,11 @@ static bool migrate_prepare(MigrationState *s,
> bool blk, bool blk_inc,
> >          return false;
> >      }
> >
> > +    if (runstate_check(RUN_STATE_POSTMIGRATE)) {
> > +        error_setg(errp, "Unable to migrate, guest has been migrated");
> > +        return false;
> > +    }
> > +
> >      if (migration_is_blocked(errp)) {
> >          return false;
> >      }
> > --
> > 2.18.4
>
> dme.
> --
> Ah, oh your hair is beautiful.
>

--000000000000dca30d05b6051077
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Thanks for telling me that. I didn&#39=
;t notice this patch.=C2=A0</div><div>I just caught this error when I used =
it and read the source code, it should be fixed.=C2=A0</div><div><br></div>=
<div>Thanks</div><div>Li</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Dec 9, 2020 at 5:23 PM David Edmondso=
n &lt;<a href=3D"mailto:dme@dme.org">dme@dme.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Wednesday, 2020-12-09 at=
 07:20:29 GMT, Li Zhang wrote:<br>
<br>
&gt; This patch is to avoid executing migrations twice, which causes<br>
&gt; coredump. After the migration has been completed, guest is in postmigr=
ated<br>
&gt; status on source host and the block device is inactive. If executing <=
br>
&gt; migration again, it will cause coredump and a block error. For exmaple=
, <br>
&gt; executing #migrate &quot;exec:cat&gt;file&quot; twice on source host, =
block error:<br>
&gt; bdrv_inactivate_recurse: Assertion `!(bs-&gt;open_flags &amp; BDRV_O_I=
NACTIVE)&#39; failed<br>
&gt;<br>
&gt; Signed-off-by: Li Zhang &lt;<a href=3D"mailto:li.zhang@cloud.ionos.com=
" target=3D"_blank">li.zhang@cloud.ionos.com</a>&gt;<br>
<br>
There is an existing proposal for this (the same approach) in<br>
<a href=3D"https://lore.kernel.org/r/6b704294ad2e405781c38fb38d68c744@h3c.c=
om" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/r/6b704294=
ad2e405781c38fb38d68c744@h3c.com</a>.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 migration/migration.c | 5 +++++<br>
&gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt;<br>
&gt; diff --git a/migration/migration.c b/migration/migration.c<br>
&gt; index 87a9b59f83..113f7e1e41 100644<br>
&gt; --- a/migration/migration.c<br>
&gt; +++ b/migration/migration.c<br>
&gt; @@ -2115,6 +2115,11 @@ static bool migrate_prepare(MigrationState *s, =
bool blk, bool blk_inc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 if (runstate_check(RUN_STATE_POSTMIGRATE)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Unable to migrate,=
 guest has been migrated&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (migration_is_blocked(errp)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -- <br>
&gt; 2.18.4<br>
<br>
dme.<br>
-- <br>
Ah, oh your hair is beautiful.<br>
</blockquote></div>

--000000000000dca30d05b6051077--

