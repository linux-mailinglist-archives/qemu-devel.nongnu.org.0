Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F11D6B85FC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 00:19:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbrQC-0004Uk-1i; Mon, 13 Mar 2023 19:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1pbrQ7-0004UB-UH
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 19:17:36 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1pbrQ5-0000QB-5X
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 19:17:34 -0400
Received: by mail-ed1-x52e.google.com with SMTP id j11so55168107edq.4
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 16:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678749450;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/9I78Cyb92tlpD0pxxthBhr0hJmIIDxB9AXNX2L7yYo=;
 b=EztFVng3SMqRAMPFyRS2iqTlFyw/musIq4ZJTe6tpYxuznXla+KIuslhxzYHyfhwNY
 qJU2ErDWAYkO70AIsZR0jdqw8GSgKpDZdSHs+i/GfCgaVouf6HZ1Bbmf4bGt49SVq9+M
 Zffa3RVsrNjUELLx5VU6cBqFSbLE1BVyblqFAT9RB4W4PELSryrSH6xF9maEQIUnyNe2
 oXh4w0krevPgXnFCWZmyaeaZpf0pWElTKMO3ZdNw6vtni3icuxTtZ1FMEeP/57weMbQW
 7htMQVV32odcxZyG9b4VjGOI+JGivhDUgS6KRgVOeJ9G5KRUYYNCwAfbcmVVrhlkbTuD
 chZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678749450;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/9I78Cyb92tlpD0pxxthBhr0hJmIIDxB9AXNX2L7yYo=;
 b=buZoOcZDLK2tOtwysJ7IhXEx8gaFnKF/YRGb+T/gmMbkMLGJmiNfIzFHpW/+Rv9dB3
 2SIOCNTUTn5P/GdQzqcSq4uSLhJH8rIYWxansO+GBc4H6VQaIDTMFfvGL3kBBrOrnlCx
 qBRO5SM7QZTHOUmE4KSDBjgcuc7ew6+SSXPpH2+ZrhORKLNCLD5NdxrVspQruF0ulCqN
 jHWAk1NtHfUcuv5qXUHKJx2MlahrBbcrSnzzfmrEV7qLZbMPtqKzlg2s4yD3by+iSxN7
 TZMfmsn2lV5F3srfak8gSnWWv/tgFU7ytH/F3KfLURZ6tkN06gFhVyG3cfDa4QDaLuFG
 F+dg==
X-Gm-Message-State: AO0yUKV3W581PyF8+IebIQF9cZaLpfnHje4O7dBTvGlQZgZxWm3uBfvW
 qWtY+FS8+DZ1Zo8IKhKe6yqOE63oaeJhHcNxLTg=
X-Google-Smtp-Source: AK7set97PfEpqjdeGqjYGfSvaN6ETH7lY49N26u1x9C+z7Z//EzMqhrvs+2EgL2O0xxKu2hDGBaQ/lkq9hbPNc3KQVE=
X-Received: by 2002:a17:907:e91:b0:924:32b2:e3d1 with SMTP id
 ho17-20020a1709070e9100b0092432b2e3d1mr146951ejc.3.1678749450023; Mon, 13 Mar
 2023 16:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org>
 <20230307182707.2298618-14-dwmw2@infradead.org>
 <CAKf6xpuH2E=16s1jFvgL9J723wv0dhBD5aYWP2NBNj5rZio2jg@mail.gmail.com>
 <5062bef5b5cfd3e2d7f313de9af306f5e4f841f5.camel@infradead.org>
In-Reply-To: <5062bef5b5cfd3e2d7f313de9af306f5e4f841f5.camel@infradead.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 13 Mar 2023 19:17:17 -0400
Message-ID: <CAKf6xptRmeVmH3xmF8QffQA=aYeXxCWUw9ta2HaYx1xQngzjTA@mail.gmail.com>
Subject: Re: [PULL 13/27] hw/xen: Add xenstore operations to allow redirection
 to internal emulation
To: David Woodhouse <dwmw2@infradead.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, 
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com, 
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=jandryuk@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi, David,

On Mon, Mar 13, 2023 at 4:45=E2=80=AFAM David Woodhouse <dwmw2@infradead.or=
g> wrote:
>
> On Sun, 2023-03-12 at 15:19 -0400, Jason Andryuk wrote:
> >
> > This breaks dm_restrict=3D1 since the xs_open is not allowed by the
> > time
> > this is called.  There are other evtchn errors before this as well:
> > # cat /var/log/xen/qemu-dm-debian.log
> > char device redirected to /dev/pts/8 (label serial0)
> > xen be core: can't open evtchn device
> > xen be core: can't open evtchn device
> > xen be core: can't open evtchn device
> > xen be core: can't open evtchn device
> > xen be core: can't open evtchn device
> > xen be core: can't open evtchn device
> > xen be core: can't open evtchn device
> > xen be core: can't open evtchn device
> > Could not contact XenStore
> >
> > Ok, those "xen be core: can't open evtchn device" were there before
> > the recent changes and seem to be non-fatal.
>
> Hm, I *think* we can just revert that part and use the global
> 'xenstore' like we did before, except via the new ops.
>
> --- a/accel/xen/xen-all.c
> +++ b/accel/xen/xen-all.c
> @@ -32,28 +32,18 @@ xendevicemodel_handle *xen_dmod;
>
>  static void xenstore_record_dm_state(const char *state)
>  {
> -    struct xs_handle *xs;
>      char path[50];
>
> -    /* We now have everything we need to set the xenstore entry. */
> -    xs =3D xs_open(0);
> -    if (xs =3D=3D NULL) {
> -        fprintf(stderr, "Could not contact XenStore\n");
> -        exit(1);
> -    }
> -
>      snprintf(path, sizeof (path), "device-model/%u/state", xen_domid);
>      /*
>       * This call may fail when running restricted so don't make it fatal=
 in
>       * that case. Toolstacks should instead use QMP to listen for state =
changes.
>       */
> -    if (!xs_write(xs, XBT_NULL, path, state, strlen(state)) &&
> +    if (!qemu_xen_xs_write(xenstore, XBT_NULL, path, state, strlen(state=
)) &&
>              !xen_domid_restrict) {
>          error_report("error recording dm state");
>          exit(1);
>      }
> -
> -    xs_close(xs);
>  }

This looks good, better than what I posted, and seems to work for both
dm_restrict set and unset.

>
> Alternatively, that xs_write is destined to fail anyway in the
> xen_domid_restrict case, isn't it? So the xs_open() should be allowed
> to fail similarly. Or perhaps we shouldn't even *try*?

For dm_restricted, xs_write() does fail.  I verified that with a print
statement.  I think "shouldn't even try" makes sense.  I'm thinking
that  xen_domid_restricted shouldn't even add the callback.  Something
like:

--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -39,8 +39,7 @@ static void xenstore_record_dm_state(const char *state)
      * This call may fail when running restricted so don't make it fatal i=
n
      * that case. Toolstacks should instead use QMP to listen for
state changes.
      */
-    if (!qemu_xen_xs_write(xenstore, XBT_NULL, path, state, strlen(state))=
 &&
-            !xen_domid_restrict) {
+    if (!qemu_xen_xs_write(xenstore, XBT_NULL, path, state, strlen(state))=
) {
         error_report("error recording dm state");
         exit(1);
     }
@@ -101,7 +100,10 @@ static int xen_init(MachineState *ms)
         xc_interface_close(xen_xc);
         return -1;
     }
-    qemu_add_vm_change_state_handler(xen_change_state_handler, NULL);
+
+    if(!xen_domid_restrict)
+        qemu_add_vm_change_state_handler(xen_change_state_handler, NULL);
+
     /*
      * opt out of system RAM being allocated by generic code
      */

That works for both dm_restrict 0 & 1.

I think you should submit your change and I can follow up with the
above if it seems desirable.

Thanks,
Jason

