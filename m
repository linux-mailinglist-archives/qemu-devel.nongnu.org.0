Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C1F47FD4F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 14:26:31 +0100 (CET)
Received: from localhost ([::1]:47544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1q1G-000361-Er
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 08:26:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n1pzG-0002Dw-6W
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 08:24:26 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:32947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n1pzE-0001YX-33
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 08:24:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=vRCv0HG6BZQ6sWcZiMydIpWyZRzIOCNfBIXydzwOwn8=; b=vvQ/0o6ZabwIJXY+EmbEjzu0ae
 X/B7v0XmjiWU+l5H5U5dgrcYtJL5dWu4lyBp+hhx5vwLZwIsrvQCtDqdxIwgTCKOCsj3EeguV325a
 9xxdO1mg3NWD0MzkyVufc1RxV+V2c1A1urG/cqtXZgaOkpuZX9m49HPgRIwKqGa50HFrYIZz5Yrto
 1EqHOhbofRB+MgRSwUpHpqNY0tGyKFhOS9Xi1tKoYuWnNEp9OjRDg7XZhCc7T0QVxbi5UTh2AwbVC
 9Rb4xT1btvE8H0f3kTCYO9vC4VHsuPtWitAosJK8b+jFtldqUCxU87LNQT/HatAiKmzekTMy+Jd3z
 fol9ioCWfS1n7LTPnEQS2LtsuMFLxjwJj0F7DaKdSOHsfr2qkYttm+RqCa5bJrLM+Ya9+zHOLah/O
 AFTqJ0uPUOi0q7OTeOnFCeYHUkQI3ugPlqEVhEfbGJ9aonJ3v/3gC9uLYCEaGn5D++Z6oEFg/lalK
 f7MWykyTOgWk4FfirwSGO1IERUbepurfltqmVBQzVcnp8XgGcXuOtck0VpSacgPdvQF8TApvX+Ep2
 NqJY9ksYLVG9Eu+zthKcRHQdf/nnOzqBc/uEy5vn2/2ZlIt47YIB/ki44tyGGNqoxJ58WbdgJxzO7
 hAmaGKbDK9R5+vhukZly0AS/pZ8G/DdDCjsqg/uKg=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Volker =?ISO-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/3] jackaudio: use ifdefs to hide unavailable functions
Date: Mon, 27 Dec 2021 14:24:19 +0100
Message-ID: <4841310.u599JrRuOa@silver>
In-Reply-To: <20211226154017.6067-1-vr_qemu@t-online.de>
References: <cf516f2a-fea8-2000-1b80-a5465d0e1ee6@t-online.de>
 <20211226154017.6067-1-vr_qemu@t-online.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sonntag, 26. Dezember 2021 16:40:15 CET Volker R=FCmelin wrote:
> On Windows the jack_set_thread_creator() function and on MacOS the
> pthread_setname_np() function with a thread pointer paramater is
> not available. Use #ifdefs to remove the jack_set_thread_creator()
> function call and the qjack_thread_creator() function in both
> cases.
>=20
> The qjack_thread_creator() function just sets the name of the
> created thread for debugging purposes and isn't really necessary.

As far as Windows is concerned, right, there is no jack_set_thread_creator(=
).

I find it actually very useful to have named threads for debugging purposes=
,=20
especially for processes that have a load of threads, but I see there would=
 be=20
no easy solution to preserve this for macOS, as on macOS pthread_setname_np=
()=20
must be called from the to be named thread itself, and the thread's entry=20
point is on JACK server side, so for now ...

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

> From the jack_set_thread_creator() documentation:
> (...)
>=20
> No normal application/client should consider calling this. (...)
>=20
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/785
> Signed-off-by: Volker R=FCmelin <vr_qemu@t-online.de>
> ---
>  audio/jackaudio.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/audio/jackaudio.c b/audio/jackaudio.c
> index e7de6d5433..317009e936 100644
> --- a/audio/jackaudio.c
> +++ b/audio/jackaudio.c
> @@ -622,6 +622,7 @@ static void qjack_enable_in(HWVoiceIn *hw, bool enabl=
e)
>      ji->c.enabled =3D enable;
>  }
>=20
> +#if !defined(WIN32) && defined(CONFIG_PTHREAD_SETNAME_NP_W_TID)
>  static int qjack_thread_creator(jack_native_thread_t *thread,
>      const pthread_attr_t *attr, void *(*function)(void *), void *arg)
>  {
> @@ -635,6 +636,7 @@ static int qjack_thread_creator(jack_native_thread_t
> *thread,
>=20
>      return ret;
>  }
> +#endif
>=20
>  static void *qjack_init(Audiodev *dev)
>  {
> @@ -687,7 +689,9 @@ static void register_audio_jack(void)
>  {
>      qemu_mutex_init(&qjack_shutdown_lock);
>      audio_driver_register(&jack_driver);
> +#if !defined(WIN32) && defined(CONFIG_PTHREAD_SETNAME_NP_W_TID)
>      jack_set_thread_creator(qjack_thread_creator);
> +#endif
>      jack_set_error_function(qjack_error);
>      jack_set_info_function(qjack_info);
>  }



