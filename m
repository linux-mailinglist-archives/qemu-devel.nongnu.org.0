Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C1B39848E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 10:51:17 +0200 (CEST)
Received: from localhost ([::1]:37058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loMaq-0007dD-HG
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 04:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loMZn-0006x1-JV
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 04:50:11 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loMZl-00017Q-IT
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 04:50:11 -0400
Received: by mail-wm1-x32e.google.com with SMTP id m18so758655wmq.0
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 01:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7YYA9xuJt1N8IWDu5R6flfmtCM36kudUuQfU89LFjmQ=;
 b=hlaQk9nDM3GiYCpSQDfPiZsrED1Z/PzZijYsRB6odv08PLDw0WzHRjTOlE9O1v6L0X
 mVsumi4MSby5iXuUKzBToID/pOUqSr4xa5b2oNKp3G8g26vDotgpmFNGqCem6ZDuxrXD
 xN7YBKmcnxatvBcjsMg0G7icacRcvYjYIuNrg1lolVWE2H0KsVqbLyBUnvO3o8rfvLVz
 1i/rQ0/2uHOUb7T4fx9lqHfktpbWvfDiI8FbwFeBxBg1wBLZd8AlCzIF5B+YDa69UsQT
 W1EewAlXKVk0KOaoIVqiD6nVK67eP6M4Ex9GyptzFmZM7iGSTq4TyRh9CNO7wxz9Jsga
 BcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7YYA9xuJt1N8IWDu5R6flfmtCM36kudUuQfU89LFjmQ=;
 b=gyAn1uYVKEFCWp0e2ig4v03SLCv/pkV1DE1nSAFvtI4B02TD/lLb3/liJWFIE6KOai
 34vV1Ke4k2xNMwb7YxamYD4VOXfDxFZk0WK2Dxgz4AdWUCkT8IAYgQW5n+KCPwHEql7t
 j2a5bCTYfI3m1PhbLh12nLK3m5RfR48fjv2LQebdgE541DOI1Vo9yF4twqhTP5cLzAUT
 DtTrRPlf5DGqUeyIAqz3dsy2OOgN5JefwuIw2eZNQf/PQZsAU/KeITPx2eypr5gqDqK3
 WUK1QFlWgsA+0glEuD9MD35zXxJcEiRGamCGghEMnSXxRhW+BnmewK/UurvXvXBD6kOM
 VcCA==
X-Gm-Message-State: AOAM530feNrdY9dqKcDD6634cTdVGOugizNskQU1Z8f9OQ9Ah9YU6KKk
 70fnLREXp3PI0TXt+2JP+p9NEA==
X-Google-Smtp-Source: ABdhPJxsYWJ6Ec30T8x/5wgFXiF5wZKEDGL/py/hBX/KzY803RAtkdiccG9pW5LdaHXx9ik9yrTZpg==
X-Received: by 2002:a05:600c:1551:: with SMTP id
 f17mr3871857wmg.17.1622623807560; 
 Wed, 02 Jun 2021 01:50:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t12sm7749517wre.9.2021.06.02.01.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 01:50:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BB1F01FF7E;
 Wed,  2 Jun 2021 09:50:05 +0100 (BST)
References: <20210601145824.3849-1-alex.bennee@linaro.org>
 <CAD-LL6iQMLG8xFMiAJfQL9y_bfSYOEWn+5ARcfO=kAkr7rqg6Q@mail.gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [RFC PATCH] plugins/api: expose symbol lookup to plugins
Date: Wed, 02 Jun 2021 09:43:20 +0100
In-reply-to: <CAD-LL6iQMLG8xFMiAJfQL9y_bfSYOEWn+5ARcfO=kAkr7rqg6Q@mail.gmail.com>
Message-ID: <87mts8bqgy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: minyihh@uci.edu, qemu-devel@nongnu.org, robhenry@microsoft.com,
 Mahmoud Abd Al Ghany <mahmoudabdalghany@outlook.com>,
 aaron@os.amperecomputing.com, "Emilio G. Cota" <cota@braap.org>,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> On Tue, Jun 1, 2021 at 4:58 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
>  This is a quality of life helper for plugins so they don't need to
>  re-implement symbol lookup when dumping an address. The strings are
>  constant so don't need to be duplicated. One minor tweak is to return
>  NULL instead of a zero length string to show lookup failed.
>
> Thank you for implementing this, I found it a really easy addition since =
you
> already told me how this is done in the kick-off meeting and I implemente=
d it
> but I'm glad you already posted it :D
>
>  Based-on: 20210530063712.6832-4-ma.mandourr@gmail.com
>  Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>  ---
>   include/qemu/qemu-plugin.h |  9 +++++++++
>   contrib/plugins/cache.c    | 10 ++++++++--
>   plugins/api.c              |  6 ++++++
>   3 files changed, 23 insertions(+), 2 deletions(-)
>
>  diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
>  index 97cdfd7761..dc3496f36c 100644
>  --- a/include/qemu/qemu-plugin.h
>  +++ b/include/qemu/qemu-plugin.h
>  @@ -525,6 +525,15 @@ qemu_plugin_register_vcpu_syscall_ret_cb(qemu_plugi=
n_id_t id,
>
>   char *qemu_plugin_insn_disas(const struct qemu_plugin_insn *insn);
>
>  +/**
>  + * qemu_plugin_insn_symbol() - best effort symbol lookup
>  + * @insn: instruction reference
>  + *
>  + * Return a static string referring to the symbol. This is dependent
>  + * on the binary QEMU is running having provided a symbol table.
>  + */
>  +const char *qemu_plugin_insn_symbol(const struct qemu_plugin_insn *insn=
);
>  +
>   /**
>    * qemu_plugin_vcpu_for_each() - iterate over the existing vCPU
>    * @id: plugin ID
>  diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
>  index 1e323494bf..afaa3d9db5 100644
>  --- a/contrib/plugins/cache.c
>  +++ b/contrib/plugins/cache.c
>  @@ -46,6 +46,7 @@ enum AccessResult {
>
>   struct InsnData {
>       char *disas_str;
>  +    const char *symbol;
>       uint64_t addr;
>       uint64_t misses;
>   };
>  @@ -377,10 +378,12 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, str=
uct qemu_plugin_tb *tb)
>           struct InsnData *idata =3D g_new(struct InsnData, 1);
>
>           ddata->disas_str =3D qemu_plugin_insn_disas(insn);
>  +        ddata->symbol =3D qemu_plugin_insn_symbol(insn);
>           ddata->misses =3D 0;
>           ddata->addr =3D effective_addr;
>
>           idata->disas_str =3D g_strdup(ddata->disas_str);
>  +        idata->symbol =3D qemu_plugin_insn_symbol(insn);
>           idata->misses =3D 0;
>           idata->addr =3D effective_addr;
>
>  @@ -397,8 +400,11 @@ static void print_entry(gpointer data)
>   {
>       struct InsnData *insn =3D (struct InsnData *) data;
>       g_autoptr(GString) xx =3D g_string_new("");
>  -    g_string_append_printf(xx, "0x%" PRIx64 ": %s - misses: %lu\n",
>  -            insn->addr, insn->disas_str, insn->misses);
>  +    g_string_append_printf(xx, "0x%" PRIx64, insn->addr);
>  +    if (insn->symbol) {
>  +        g_string_append_printf(xx, " (%s)", insn->symbol);
>  +    }
>  +    g_string_append_printf(xx, ", %lu, %s\n", insn->misses, insn->disas=
_str);
>       qemu_plugin_outs(xx->str);
>   }
>
>  diff --git a/plugins/api.c b/plugins/api.c
>  index 817c9b6b69..332e2c60e2 100644
>  --- a/plugins/api.c
>  +++ b/plugins/api.c
>  @@ -233,6 +233,12 @@ char *qemu_plugin_insn_disas(const struct qemu_plug=
in_insn *insn)
>       return plugin_disas(cpu, insn->vaddr, insn->data->len);
>   }=20
>
>  +const char *qemu_plugin_insn_symbol(const struct qemu_plugin_insn *insn)
>  +{
>  +    const char *sym =3D lookup_symbol(insn->vaddr);
>  +    return sym[0] !=3D 0 ? sym : NULL;
>  +}
>  +
>   /*
>    * The memory queries allow the plugin to query information about a
>    * memory access.
>  --=20
>  2.20.1
>
> How can I address such an addition? Should I add it to my next RFC series
> under your name using your Signed-off-by line?

Yes, if you git am the patch to your series it will keep my authorship
and also copy the message-id of the post it came from. When you re-base
you can add your s-o-b tag to indicate that to the best of your
knowledge it is code that can be included in the tree (which it is, I
posted it to qemu-devel ;-).

> Also, I think that somethings
> in my series that you're basing your patch on will be changed, such as ha=
ving
> two duplicated entries of InsnData and the stupid name "xx" of the report=
 string
> How can I base your patch after my edits?

You have two choices. Move the patch to the start of your series and
drop the actual plugin tweaks and make it API only or keep it at the end
of the series and fix it up when you re-base. Generally you make a note
"under the line" of the changes so the commit message would look like:

  plugins/api: expose symbol lookup to plugins

  This is a quality of life helper for plugins so they don't need to
  re-implement symbol lookup when dumping an address. The strings are
  constant so don't need to be duplicated. One minor tweak is to return
  NULL instead of a zero length string to show lookup failed.

  Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
  Message-Id: <20210601145824.3849-1-alex.bennee@linaro.org>
  Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>

  ---
  v3
    - included in my tree, fixed up rebase conflicts

This is a useful reference for people reading the patches on the list to
see what changed. The tooling will drop everything under --- when it is
applied to a tree.

--=20
Alex Benn=C3=A9e

