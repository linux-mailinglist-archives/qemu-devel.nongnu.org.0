Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C5660A267
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 13:42:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omvI6-00051G-3z; Mon, 24 Oct 2022 07:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1omvI4-0004zP-4b
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:06:44 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1omvI2-0005pi-Dx
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:06:43 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1322d768ba7so11426667fac.5
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 04:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cgLzXaT6dLw5TNGf5bcGcQQYvkat9WyvjkpOw1QBReI=;
 b=Eq3dkTdT8Z8hzJXy3VQ5r6tWpJhtRfRhOzO/lBQGXzbPouh4SVJSgopXnKS9Ug6Qn7
 S/OnhKYozvRuUP5olaF9tdzTu+JnPXKqnxRmOhC7GyTd5UIuXtwC8+yJY5dW/IxwzUC4
 4CM/mq9bBh9AgJCq507T2Gld4Air87FxqR+bvd94ZiqJaR/rMKWCQtPmlIYoAb/47kqH
 QgoqKXLBg8ukQhIBtdgMfSOZJLRhEbHzD6XRbl9/Va70S18ECpjsmfKuEsIbb0cyO/0T
 Zf23Auq8Q9+3VyYDAfNozD3BNb0SwI2oAJfnEilVC6i+eKzIrVaCSs/fzKArSw3icGrH
 A96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cgLzXaT6dLw5TNGf5bcGcQQYvkat9WyvjkpOw1QBReI=;
 b=qya39sk3VLyOtbR/VehdIJqnjeBc9qDihXQxeMxtMF/34/pB9AuHtxzSo1NTuhuMrC
 KY9Nx9m9SL/+/Rf+H3tjmMc3eV9BwWw0DE+cKrYEBeT1HVEVRRHrHMwGg+hGyEIE6AlD
 70ebSR0uFuOH4lr8cMxLYUxYjPQ7g+WyUjEf957CzpRYyc3Dy411zi66/vPCH7YnQa1Z
 gt/kP9cCr8+PH33VM0ZAlhPk3x1O6BTe+R4QnkoYUbNe3aQ9XjzYe5SI7D+OeQKxtMZm
 +T9B7DeZ2NFOQSS4PjtAez0B8IA7Js2mkmQ6OICFHjSvnKwT/HD1LNllVIiJ7tNPtFPl
 oFqw==
X-Gm-Message-State: ACrzQf1gazhtAebi2arwKTyCQWlzhJiGS+vzMYIIcRn8t9CMVag8Vipw
 Ry39QarAdRsubcAs+MaN4TiYRhgZcubwnMJkrVy330sxipk=
X-Google-Smtp-Source: AMsMyM7P+Z+91QkZy1zzM17SAi655vjo6B+ACUn4f0PFnsSMma6S/PB74dhzYN7sz0N9ArV8OO4uH4lHofLOXPoUeGU=
X-Received: by 2002:a17:90b:f06:b0:212:cb07:fb82 with SMTP id
 br6-20020a17090b0f0600b00212cb07fb82mr20114928pjb.221.1666609590595; Mon, 24
 Oct 2022 04:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221014021653.1461512-1-Jason@zx2c4.com>
 <20221014021653.1461512-2-Jason@zx2c4.com>
In-Reply-To: <20221014021653.1461512-2-Jason@zx2c4.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Oct 2022 12:06:18 +0100
Message-ID: <CAFEAcA8jra50q_DvNTGG8Wi+eF+PEKPHnfLNBhUjG9muqiPe0A@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] reset: allow registering handlers that aren't
 called by snapshot loading
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, richard.henderson@linaro.org, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

(Cc'ing Markus for a QMP related question.)

On Fri, 14 Oct 2022 at 03:17, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Snapshot loading only expects to call deterministic handlers, not
> non-deterministic ones. So introduce a way of registering handlers that
> won't be called when reseting for snapshots.
>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

> diff --git a/migration/savevm.c b/migration/savevm.c
> index 48e85c052c..a0cdb714f7 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -3058,7 +3058,7 @@ bool load_snapshot(const char *name, const char *vmstate,
>          goto err_drain;
>      }
>
> -    qemu_system_reset(SHUTDOWN_CAUSE_NONE);
> +    qemu_system_reset(SHUTDOWN_CAUSE_SNAPSHOT_LOAD);
>      mis->from_src_file = f;
>
>      if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
> diff --git a/qapi/run-state.json b/qapi/run-state.json
> index 9273ea6516..74ed0ac93c 100644
> --- a/qapi/run-state.json
> +++ b/qapi/run-state.json
> @@ -86,12 +86,14 @@
>  #                   ignores --no-reboot. This is useful for sanitizing
>  #                   hypercalls on s390 that are used during kexec/kdump/boot
>  #
> +# @snapshot-load: A snapshot is being loaded by the record & replay subsystem.
> +#
>  ##
>  { 'enum': 'ShutdownCause',
>    # Beware, shutdown_caused_by_guest() depends on enumeration order
>    'data': [ 'none', 'host-error', 'host-qmp-quit', 'host-qmp-system-reset',
>              'host-signal', 'host-ui', 'guest-shutdown', 'guest-reset',
> -            'guest-panic', 'subsystem-reset'] }
> +            'guest-panic', 'subsystem-reset', 'snapshot-load'] }

Markus: do we need to mark new enum values with some kind of "since n.n"
version info ?

>  ##
>  # @StatusInfo:
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index 1e68680b9d..03e1ee3a8a 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -441,9 +441,9 @@ void qemu_system_reset(ShutdownCause reason)
>      cpu_synchronize_all_states();
>
>      if (mc && mc->reset) {
> -        mc->reset(current_machine);
> +        mc->reset(current_machine, reason);
>      } else {
> -        qemu_devices_reset();
> +        qemu_devices_reset(reason);
>      }
>      if (reason && reason != SHUTDOWN_CAUSE_SUBSYSTEM_RESET) {
>          qapi_event_send_reset(shutdown_caused_by_guest(reason), reason);

This change means that resets on snapshot-load, which previously
did not result in sending a QMP event, will now start to do so
with this new ShutdownCause type. I don't think we want that
change in behaviour.

(Also, as per the 'Beware' comment in run-state.json, we will
claim this to be a 'caused by guest' reset, which doesn't seem
right. If we suppress the sending the event that is moot, though.)

Markus: if we add a new value to the ShutdownCause enumeration,
how annoying is it if we decide we don't want it later? I guess
we can just leave it in the enum unused... (In this case we're
using it for purely internal purposes and it won't ever actually
wind up in any QMP events.)

thanks
-- PMM

