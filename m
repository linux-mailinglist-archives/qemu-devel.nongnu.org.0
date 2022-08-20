Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC35559ABF7
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 09:16:32 +0200 (CEST)
Received: from localhost ([::1]:40984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPIid-000720-A6
	for lists+qemu-devel@lfdr.de; Sat, 20 Aug 2022 03:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1oPIge-0005eI-U1
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 03:14:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1oPIga-0002Xl-Kv
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 03:14:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660979662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZRhBBHaCTDYtxUxLbqolL5BiESy+qB3h0jZiqsYqjqk=;
 b=Ksekxg8RZt5IYHuE9Y5YOxnIdDcANb1Cleq1gxDyb3dVcoCyjP5MeFsZDA5KH5xEyeEb9i
 r96D5NpwxQNiaary5FKr5SWoIAhW5ecrD+0am20nF2vxkTAGp/p62ehKQHqhGXyzDjgoze
 zQnm6fFeBibUefFtK1S1z+PJyOPOCCg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-8eWxdFsBPBKVu7cQ6KLOqA-1; Sat, 20 Aug 2022 03:14:15 -0400
X-MC-Unique: 8eWxdFsBPBKVu7cQ6KLOqA-1
Received: by mail-ed1-f72.google.com with SMTP id
 q32-20020a05640224a000b004462f105fa9so2766130eda.4
 for <qemu-devel@nongnu.org>; Sat, 20 Aug 2022 00:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=ZRhBBHaCTDYtxUxLbqolL5BiESy+qB3h0jZiqsYqjqk=;
 b=Pm5rvjQL1qr+aQckc5TYETYAhvgCVmV0XCVpf4d7IShBO3orEetY3GHXwofVO3QWWc
 6hYaGKb9MEfgfwCaMtZy7LFxTznRZwJrswk+YIGjCfvjDHxAu/a3gVIhNAzGM2ZXSIYt
 yxdCnPJhIP4PYk6Ap6BB0C5NuLPBWr0C3WNdSJeeGsj95IB/6J3rrRqw7wDtUQMj2BkS
 3Wpn6M+a7ZsPUa+neIXSJWjOtSc7LSOgPQpKZL73sW2FXKCOAepsycxer82tFgN7ezOB
 81qgvBzISw2lOqN35w8v+asHGilrq8YOnzRRJM1ziWxPgdH+mjf3uBxj1jdQ5i4U64/p
 eM8A==
X-Gm-Message-State: ACgBeo3PePWacFHLBWTwdRwWawlDPFtaP8AGVnL3ePwLi9jibonEev/J
 1Q5dBuy749g3RoB2fzcHdMgaQ8ehVGaRGVNN5nhnJ8BRJrcA4gHdy0QkdEcBSOX30g3xZ0hGlPj
 1ip34cBIBUrMsOwxxOQGaK4I+QJSjkhk=
X-Received: by 2002:a05:6402:5192:b0:43d:cc0d:6ea4 with SMTP id
 q18-20020a056402519200b0043dcc0d6ea4mr8600243edd.111.1660979654751; 
 Sat, 20 Aug 2022 00:14:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6R5taEE7yFO7zlPfesYTeGu7tkiH5QGtsLUCAUEd/xp3rSOVYhlZ06CEBoqXq4MxCbGglUdtjVgr5IlkUnNAQ=
X-Received: by 2002:a05:6402:5192:b0:43d:cc0d:6ea4 with SMTP id
 q18-20020a056402519200b0043dcc0d6ea4mr8600220edd.111.1660979654414; Sat, 20
 Aug 2022 00:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-6-quintela@redhat.com>
 <01fcdde9f6246836b4058efc8c298a82e86d1458.camel@redhat.com>
 <87h7281ryc.fsf@secure.mitica>
In-Reply-To: <87h7281ryc.fsf@secure.mitica>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Sat, 20 Aug 2022 04:14:03 -0300
Message-ID: <CAJ6HWG4QsPK9y6+HE60BXT+F2bDxrfG4_oNvqgc_a9eMFVm-Dw@mail.gmail.com>
Subject: Re: [PATCH v7 05/12] migration: Make ram_save_target_page() a pointer
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eric Blake <eblake@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster <armbru@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>
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

On Fri, Aug 19, 2022 at 6:52 AM Juan Quintela <quintela@redhat.com> wrote:
>
> Leonardo Br=C3=A1s <leobras@redhat.com> wrote:
> > On Tue, 2022-08-02 at 08:39 +0200, Juan Quintela wrote:
> >> We are going to create a new function for multifd latest in the series=
.
> >>
> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
> >> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
> >
> > Double Signed-off-by again.
> >
> >> ---
> >>  migration/ram.c | 13 +++++++++----
> >>  1 file changed, 9 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/migration/ram.c b/migration/ram.c
> >> index 85d89d61ac..499d9b2a90 100644
> >> --- a/migration/ram.c
> >> +++ b/migration/ram.c
> >> @@ -310,6 +310,9 @@ typedef struct {
> >>      bool preempted;
> >>  } PostcopyPreemptState;
> >>
> >> +typedef struct RAMState RAMState;
> >> +typedef struct PageSearchStatus PageSearchStatus;
> >> +
> >>  /* State of RAM for migration */
> >>  struct RAMState {
> >>      /* QEMUFile used for this migration */
> >> @@ -372,8 +375,9 @@ struct RAMState {
> >>       * is enabled.
> >>       */
> >>      unsigned int postcopy_channel;
> >> +
> >> +    int (*ram_save_target_page)(RAMState *rs, PageSearchStatus *pss);
> >>  };
> >> -typedef struct RAMState RAMState;
> >>
> >>  static RAMState *ram_state;
> >>
> >> @@ -2255,14 +2259,14 @@ static bool save_compress_page(RAMState *rs, R=
AMBlock *block, ram_addr_t offset)
> >>  }
> >>
> >>  /**
> >> - * ram_save_target_page: save one target page
> >> + * ram_save_target_page_legacy: save one target page
> >>   *
> >>   * Returns the number of pages written
> >>   *
> >>   * @rs: current RAM state
> >>   * @pss: data about the page we want to send
> >>   */
> >> -static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
> >> +static int ram_save_target_page_legacy(RAMState *rs, PageSearchStatus=
 *pss)
> >>  {
> >>      RAMBlock *block =3D pss->block;
> >>      ram_addr_t offset =3D ((ram_addr_t)pss->page) << TARGET_PAGE_BITS=
;
> >> @@ -2469,7 +2473,7 @@ static int ram_save_host_page(RAMState *rs, Page=
SearchStatus *pss)
> >>
> >>          /* Check the pages is dirty and if it is send it */
> >>          if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) =
{
> >> -            tmppages =3D ram_save_target_page(rs, pss);
> >> +            tmppages =3D rs->ram_save_target_page(rs, pss);
> >>              if (tmppages < 0) {
> >>                  return tmppages;
> >>              }
> >> @@ -3223,6 +3227,7 @@ static int ram_save_setup(QEMUFile *f, void *opa=
que)
> >>      ram_control_before_iterate(f, RAM_CONTROL_SETUP);
> >>      ram_control_after_iterate(f, RAM_CONTROL_SETUP);
> >>
> >> +    (*rsp)->ram_save_target_page =3D ram_save_target_page_legacy;
> >>      ret =3D  multifd_send_sync_main(f);
> >>      if (ret < 0) {
> >>          return ret;
> >
> >
> > So, IIUC:
> > - Rename ram_save_target_page -> ram_save_target_page_legacy
> > - Add a function pointer to RAMState (or a callback)
> > - Assign function pointer =3D ram_save_target_page_legacy at setup
> > - Replace ram_save_target_page() by indirect function call using above =
pointer.
> >
> > I could see no issue in this, so I belive it works fine.
> >
> > The only thing that concerns me is the name RAMState.
>
> Every device state is setup in RAMState.
>
> > IMHO, a struct named RAMState is supposed to just reflect the state of =
ram (or
> > according to this struct's comments, the state of RAM for migration. Ha=
ving a
> > function pointer here that saves a page seems counterintuitive, since i=
t does
> > not reflect the state of RAM.
>
> The big problem for adding another struct is that we would have to
> change all the callers, or yet another global variable.  Both are bad
> idea in my humble opinion.
>
> > Maybe we could rename the struct, or even better, create another struct=
 that
> > could look something like this:
> >
> > struct RAMMigration {
> >     RAMState state;
> >     int (*ram_save_target_page)(RAMState *rs, PageSearchStatus *pss);
> >     /* Other callbacks or further info.*/
> > }
> >
> > What do you think about it?
>
> Really this depends on configuration.  What is setup for qemu
> migration.  I think this is the easiest way to do it, we can add a new
> struct, but it gets everything much more complicated:
>
> - the value that we receive in ram_save_setup() is a RAMState
> - We would have to change all the callers form
>   * ram_save_iterate()
>   * ram_find_and_save_block()
>   * ram_save_host_page()

Maybe RAMState could be part of a bigger struct, and we could use
something like a container_of().
So whenever you want to use it, it would be available.

What about that?

>
> So I think it is quite a bit of churn for not a lot of gain.
>
> Later, Juan.
>


