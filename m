Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF64649A57
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 09:49:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4eTH-0006s5-Hm; Mon, 12 Dec 2022 03:47:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4eT7-0006nY-Aq
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 03:47:32 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4eT5-0008Sa-52
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 03:47:25 -0500
Received: by mail-lf1-x129.google.com with SMTP id q6so7307384lfm.10
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 00:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IPUnMJZFnZ+0CyZaPG5jOGdLyvgLRMYIIDKp+BYVl08=;
 b=oszT6vZqK3PtINQI9jfnA8acnx9CUAynoap4NLQt9qxRwo1zl+EE8usR3pSTvumrG6
 XI3Bpbllx5hlfx9LBi76TCLkQMTkA7yM5T3vRyE/HtGed+qOjkbevTi+eAjnRSh6cQg3
 cLWUdtQnVTrk8XYU4GzxWNtBqh5BL9TbwrXmLWgbvySHMehLsJJ0exia2Ppm8eyvMOgw
 uHFzU0l2Ai6YOkBToFPdQJi/gHzsNtGzK/rclE2xm84wp6h6HcuDxJL/gVytHogEm4aW
 b7DAPmHL4oNLAHHdDfJGowFLTI007rNAL/4zwMMAurwzJc6ImMQQGkrbm5dJXAUlRFZS
 DX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IPUnMJZFnZ+0CyZaPG5jOGdLyvgLRMYIIDKp+BYVl08=;
 b=ImGunaxFPnTdM3vj1lHvFa8a0Sal65C+2gNrPALFWF+S5O03cPbge0DSktSKlOawN7
 sAXSrwo5nKOC85DTjf+JomyFfkf3vZR5MvpVI+BCnss7UUJbb6H1jhA7UT7OUmCMohT9
 mqDkaiod+OgFFEAIPAAFp8EhUtf+Q/q6p9nenzkfCTCpdkMs1PTPsRGx9Y5CYNb2VC6A
 AoiwUc/DOZbq33Oa6L8DDJNjvELi63H8G63+n57HsGCk/uZFA0FcPOWSVO4ZVVqu07Pr
 Jl8V4jd0EnGapLe56ioJ1ln3u2RlpjKuyGoxQPFJobonwZ0vdOjd0pJXcePIybFHhF5E
 fqqQ==
X-Gm-Message-State: ANoB5pkLdUFF4ZmJZo9Oee439TWcCJlu7XcHYhH3jnk6votkEPJvbsuL
 KIlpG3CBqSHngfQx5Ba39t8gyrvnG35qgf6wGbY=
X-Google-Smtp-Source: AA0mqf7pof9A6hxQTI4csJbkz2VTqZDUEVUZQW7RCemPNykE/aZRwcuVbfSKl+6CVp57ZenecuAuvziO9e8pL1GI350=
X-Received: by 2002:ac2:55b5:0:b0:4b5:b787:623c with SMTP id
 y21-20020ac255b5000000b004b5b787623cmr879840lfg.328.1670834835091; Mon, 12
 Dec 2022 00:47:15 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-13-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-13-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Dec 2022 12:47:03 +0400
Message-ID: <CAJ+F1CLthA-jTHb3RaM_vukeux2tzo95zMRnwKg7-qt07qEOtw@mail.gmail.com>
Subject: Re: [PATCH 12/30] modinfo: lookup compile_commands.json by object
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x129.google.com
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

On Fri, Dec 9, 2022 at 3:43 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> With Meson 0.63 having fixed various issues with extract_objects, the
> compile_commands.json lookups can be simplified.  If the lookup uses
> the object file as key, there is no need to use the command line to
> distinguish among all entries for a given source.
>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  meson.build                | 14 ++++----------
>  scripts/modinfo-collect.py | 23 +++++++++++------------
>  2 files changed, 15 insertions(+), 22 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 9ccbe0f6e4ee..8a9ed5628317 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3123,16 +3123,11 @@ foreach d, list : modules
>          softmmu_mods +=3D sl
>        endif
>        if module_ss.sources() !=3D []
> -        # FIXME: Should use sl.extract_all_objects(recursive: true) as
> -        # input. Sources can be used multiple times but objects are
> -        # unique when it comes to lookup in compile_commands.json.
> -        # Depnds on a mesion version with
> -        # https://github.com/mesonbuild/meson/pull/8900
>          modinfo_files +=3D custom_target(d + '-' + m + '.modinfo',
>                                         output: d + '-' + m + '.modinfo',
> -                                       input: module_ss.sources() + genh=
,
> +                                       input: sl.extract_all_objects(rec=
ursive: true),
>                                         capture: true,
> -                                       command: [modinfo_collect, module=
_ss.sources()])
> +                                       command: [modinfo_collect, '@INPU=
T@'])
>        endif
>      else
>        if d =3D=3D 'block'
> @@ -3165,12 +3160,11 @@ foreach d, list : target_modules
>                                  c_args: c_args,
>                                  pic: true)
>              softmmu_mods +=3D sl
> -            # FIXME: Should use sl.extract_all_objects(recursive: true) =
too.
>              modinfo_files +=3D custom_target(module_name + '.modinfo',
>                                             output: module_name + '.modin=
fo',
> -                                           input: target_module_ss.sourc=
es() + genh,
> +                                           input: sl.extract_all_objects=
(recursive: true),
>                                             capture: true,
> -                                           command: [modinfo_collect, '-=
-target', target, target_module_ss.sources()])
> +                                           command: [modinfo_collect, '-=
-target', target, '@INPUT@'])
>            endif
>          endif
>        endforeach
> diff --git a/scripts/modinfo-collect.py b/scripts/modinfo-collect.py
> index 4e7584df6676..48bd92bd6180 100755
> --- a/scripts/modinfo-collect.py
> +++ b/scripts/modinfo-collect.py
> @@ -7,15 +7,6 @@
>  import shlex
>  import subprocess
>
> -def find_command(src, target, compile_commands):
> -    for command in compile_commands:
> -        if command['file'] !=3D src:
> -            continue
> -        if target !=3D '' and command['command'].find(target) =3D=3D -1:
> -            continue
> -        return command['command']
> -    return 'false'
> -
>  def process_command(src, command):
>      skip =3D False
>      out =3D []
> @@ -43,14 +34,22 @@ def main(args):
>          print("MODINFO_DEBUG target %s" % target)
>          arch =3D target[:-8] # cut '-softmmu'
>          print("MODINFO_START arch \"%s\" MODINFO_END" % arch)
> +
>      with open('compile_commands.json') as f:
> -        compile_commands =3D json.load(f)
> -    for src in args:
> +        compile_commands_json =3D json.load(f)
> +    compile_commands =3D { x['output']: x for x in compile_commands_json=
 }
> +
> +    for obj in args:
> +        entry =3D compile_commands.get(obj, None)
> +        if not entry:
> +            sys.stderr.print('modinfo: Could not find object file', obj)
> +            sys.exit(1)
> +        src =3D entry['file']
>          if not src.endswith('.c'):
>              print("MODINFO_DEBUG skip %s" % src)
>              continue
> +        command =3D entry['command']
>          print("MODINFO_DEBUG src %s" % src)
> -        command =3D find_command(src, target, compile_commands)
>          cmdline =3D process_command(src, command)
>          print("MODINFO_DEBUG cmd", cmdline)
>          result =3D subprocess.run(cmdline, stdout =3D subprocess.PIPE,
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

