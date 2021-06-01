Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F08239725D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 13:31:14 +0200 (CEST)
Received: from localhost ([::1]:42374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo2c4-0002Vk-Ji
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 07:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lo2aR-0000gd-1e
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:29:31 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:34504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lo2aL-0002GZ-AF
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:29:30 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso1121374wmc.1
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 04:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=UDTccMHylWkNvdanBlrrYTapev3zuulFwiN4Ht6Si7c=;
 b=L5klv0dL/Z1cR7bcUfLOCv9kFrXSEIahxVMu7+jshQQmctuYSi+aNa6L1nbyWCl/96
 +H9rwitPskb5f5M7xaEi/cOw+6huoSSfgZGWCD51PbhjYxqNBKU6a4FfAYPrvR7BktyF
 P+YxjoKj/ZeEM7FjtgGnJ8koXinxr8t1d7/lBa6IwB2Dj1LKqM+1s2BhCfXabdYOk9mc
 qWa36vP47Ego0llx3gUmbG5uEs/klTV4J8re+SBSAiC3k7qmirm4h0MlNUBvQj8Vfib/
 j0W9SmJB/r/gElVVhcYp3QYJjAHPM7MrIs9KWtmHP761mkTuHeNsaRBztu+ql5opqiHp
 SXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=UDTccMHylWkNvdanBlrrYTapev3zuulFwiN4Ht6Si7c=;
 b=R79xpKnLTvVOrL3GuIiN/r+Fq18ilWXkiEbYdmKFtX1VzwX98PEJQ0Svlh9oxbwpL9
 NFg+5SHnFIJXV8axac5IsaOYN+E4GEKIcrUhCzZMCVa515oAbPVOa3+aWbM1AwHFEtE6
 FSu4gbg4UPhZ3/sl2sQX/pYZqO1+LYdyVONWMP31xZWngpVRxmr21XZMIHB7C4tcUmVT
 Q53iF67qYUteZUKfxYt1xaEcyu4/eJuKhLYD/brRKjZ1eV6S+imQBUSPIQV8Bh9Z4VQV
 pSxwCtFxnq6BHcqD2HLEzASJzqp0SDcEDaFWXw/BIWsccyGeY8ViUOUWcalkjxK0I467
 evuA==
X-Gm-Message-State: AOAM532BHVASYKyz5C/K8AdGXHw+XFXYtHGb11jzxmUB7+8Kz23qbz9G
 4gRcgoAHbVFF4dGFevl3IvUSPA==
X-Google-Smtp-Source: ABdhPJwGvcEMaIUyGD1YyEIpsUNrGYCY5EebCNDbe6lvDmVI6AeU+pWLe6rClwnDSS9AS7Qs/fRFmw==
X-Received: by 2002:a1c:cc12:: with SMTP id h18mr25765437wmb.141.1622546963186; 
 Tue, 01 Jun 2021 04:29:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j10sm2948107wrt.32.2021.06.01.04.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 04:29:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 81E701FF7E;
 Tue,  1 Jun 2021 12:29:21 +0100 (BST)
References: <20210530063712.6832-1-ma.mandourr@gmail.com>
 <20210530063712.6832-3-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [RFC PATCH v2 2/3] plugins: cache: Enabled parameterization and
 added trace printing
Date: Tue, 01 Jun 2021 12:18:58 +0100
In-reply-to: <20210530063712.6832-3-ma.mandourr@gmail.com>
Message-ID: <877djdddri.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


(Stefan CC'ed for tracing discussion)

Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Made both icache and dcache configurable through plugin arguments
> and added memory trace printing in a separate file.

Please keep the commits discreet and single topic. The memory trace is
an extra feature so should be in it's own commit.

>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  contrib/plugins/cache.c | 68 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 66 insertions(+), 2 deletions(-)
>
> diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
> index 8c9d1dd538..fa0bf1dd40 100644
> --- a/contrib/plugins/cache.c
> +++ b/contrib/plugins/cache.c
> @@ -22,7 +22,7 @@ static GRand *rng;
>  static GHashTable *dmiss_ht;
>  static GHashTable *imiss_ht;
>=20=20
> -static GMutex dmtx, imtx;
> +static GMutex dmtx, imtx, fmtx;
>=20=20
>  static int limit;
>  static bool sys;
> @@ -33,6 +33,8 @@ static uint64_t dmisses;
>  static uint64_t imem_accesses;
>  static uint64_t imisses;
>=20=20
> +FILE *tracefile;
> +
>  static enum qemu_plugin_mem_rw rw =3D QEMU_PLUGIN_MEM_RW;
>=20=20
>  enum AccessResult {
> @@ -205,6 +207,16 @@ static void vcpu_mem_access(unsigned int cpu_index, =
qemu_plugin_meminfo_t info,
>      insn_addr =3D ((struct InsnData *) userdata)->addr;
>      effective_addr =3D hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) : v=
addr;
>=20=20
> +    if (tracefile) {
> +        g_mutex_lock(&fmtx);
> +        g_autoptr(GString) rep =3D g_string_new("");
> +        bool is_store =3D qemu_plugin_mem_is_store(info);
> +        g_string_append_printf(rep, "%c: 0x%" PRIx64,
> +                is_store ? 'S' : 'L', effective_addr);
> +        fprintf(tracefile, "%s\n", rep->str);
> +        g_mutex_unlock(&fmtx);
> +    }

I can see this would be useful for debugging but I'm wary of adding
ad-hoc tracing formats when QEMU already has support for a wide range of
tracing formats. We discussed this a bit in:

  Subject: trace_FOO_tcg bit-rotted?
  Date: Tue, 06 Apr 2021 17:00:20 +0100
  Message-ID: <87eefnwd0l.fsf@linaro.org>

However I don't know how easy it would be to leverage the existing
tracing infrastructure from inside a plugin. As I understand it QEMU
currently builds a static list of trace points during the build so maybe
we would need additional infrastructure for a plugin to register a trace
point and for the final output to be use-able. For example the binary
trace output I think still needs to reference the source trace-events
file?

So that's not a NACK but maybe we could spend a little time working out
if we can come up with a cleaner solution?

Stefan, any thoughts?

>      if (access_cache(dcache, effective_addr) =3D=3D MISS) {
>          struct InsnData *insn =3D get_or_create(dmiss_ht, userdata, insn=
_addr);
>          insn->misses++;
> @@ -221,11 +233,20 @@ static void vcpu_insn_exec(unsigned int vcpu_index,=
 void *userdata)
>      g_mutex_lock(&imtx);
>      addr =3D ((struct InsnData *) userdata)->addr;
>=20=20
> +    if (tracefile) {
> +        g_mutex_lock(&fmtx);
> +        g_autoptr(GString) rep =3D g_string_new("");
> +        g_string_append_printf(rep, "I: 0x%" PRIx64, addr);
> +        fprintf(tracefile, "%s\n", rep->str);
> +        g_mutex_unlock(&fmtx);
> +    }
> +
>      if (access_cache(icache, addr) =3D=3D MISS) {
>          struct InsnData *insn =3D get_or_create(imiss_ht, userdata, addr=
);
>          insn->misses++;
>          imisses++;
>      }
> +
>      imem_accesses++;
>      g_mutex_unlock(&imtx);
>  }
> @@ -352,6 +373,15 @@ static void plugin_exit()
>=20=20
>      g_mutex_unlock(&dmtx);
>      g_mutex_unlock(&imtx);
> +
> +    if (tracefile) {
> +        fclose(tracefile);
> +    }
> +}
> +
> +static bool bad_cache_params(int blksize, int assoc, int cachesize)
> +{
> +    return (cachesize % blksize) !=3D 0 || (cachesize % (blksize * assoc=
) !=3D 0);
>  }
>=20=20
>  QEMU_PLUGIN_EXPORT
> @@ -377,14 +407,48 @@ int qemu_plugin_install(qemu_plugin_id_t id, const =
qemu_info_t *info,
>=20=20
>      for (i =3D 0; i < argc; i++) {
>          char *opt =3D argv[i];
> -        if (g_str_has_prefix(opt, "limit=3D")) {
> +        if (g_str_has_prefix(opt, "I=3D")) {
> +            gchar **toks =3D g_strsplit(opt + 2, " ", -1);
> +            if (g_strv_length(toks) !=3D 3) {
> +                fprintf(stderr, "option parsing failed: %s\n", opt);
> +                return -1;
> +            }
> +            icachesize =3D g_ascii_strtoull(toks[0], NULL, 10);
> +            iassoc =3D g_ascii_strtoull(toks[1], NULL, 10);
> +            iblksize =3D g_ascii_strtoull(toks[2], NULL, 10);
> +        } else if (g_str_has_prefix(opt, "D=3D")) {
> +            gchar **toks =3D g_strsplit(opt + 2, " ", -1);
> +            if (g_strv_length(toks) !=3D 3) {
> +                fprintf(stderr, "option parsing failed: %s\n", opt);
> +                return -1;
> +            }
> +            dcachesize =3D g_ascii_strtoull(toks[0], NULL, 10);
> +            dassoc =3D g_ascii_strtoull(toks[1], NULL, 10);
> +            dblksize =3D g_ascii_strtoull(toks[2], NULL, 10);
> +        } else if (g_str_has_prefix(opt, "limit=3D")) {
>              limit =3D g_ascii_strtoull(opt + 6, NULL, 10);
> +        } else if (g_str_has_prefix(opt, "tracefile=3D")) {
> +            char *file_name =3D opt + 10;
> +            tracefile =3D fopen(file_name, "w");
> +            if (!tracefile) {
> +                fprintf(stderr, "could not open: %s for writing\n", file=
_name);
> +            }
>          } else {
>              fprintf(stderr, "option parsing failed: %s\n", opt);
>              return -1;
>          }
>      }
>=20=20
> +    if (bad_cache_params(iblksize, iassoc, icachesize)) {
> +        fprintf(stderr, "icache cannot be constructed from given paramet=
ers\n");
> +        return -1;
> +    }
> +
> +    if (bad_cache_params(dblksize, dassoc, dcachesize)) {
> +        fprintf(stderr, "dcache cannot be constructed from given paramet=
ers\n");
> +        return -1;
> +    }
> +

Perhaps roll bad_cache_params into cache_init and return NULL if it
fails, so:

  dcache =3D cache_init(dblksize, dassoc, dcachesize);
  if (!dcache) {
    fprintf(stderr, "dcache cannot be constructed from given parameters\n");
    return -1;
  }

>      dcache =3D cache_init(dblksize, dassoc, dcachesize);
>      icache =3D cache_init(iblksize, iassoc, icachesize);


--=20
Alex Benn=C3=A9e

