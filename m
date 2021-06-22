Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 432A53B07C4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 16:44:50 +0200 (CEST)
Received: from localhost ([::1]:45480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvhdx-0007GY-Bo
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 10:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvhcu-0006ar-HE
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:43:44 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvhcq-00070Q-LL
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:43:44 -0400
Received: by mail-wr1-x435.google.com with SMTP id i94so23961152wri.4
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 07:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=JKgm5Qs4f0O+CUuGMtFbdGMppixGLAgTPBfwZByEhAQ=;
 b=ooUzBDbjV1nXHwvtNt2yJ7K3s4K6ggC+EeX9TRIhNM4PZLnW8orCGUJwIzK8PdKM5S
 F3iVpNNmxbuXxtVISrgHwVsd73KoF7mOWfxaAUyRvrTFqpmoKkJ57oNiF44huKlS0gQX
 yXVLFllP58YQD3NfaZFzbDspc0O0D9/DSZ8J0vfuvctaR13hDtWYUygGnhOimy16+qEb
 qXJffplZ07c0zoBy/viyW3ZT3zTusg6OrZdt7R7f9bKfefRzNSDjaKXmXnjE3zkjOHLw
 IT1ReL6hxk6lJSoetT+l1h7hWcPL3U5CtPwUG3gKK7IiUO4qlNBWlY0rkZVCSW5i1pcT
 MWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=JKgm5Qs4f0O+CUuGMtFbdGMppixGLAgTPBfwZByEhAQ=;
 b=Q3k/2+fOckYc33mtKN356iU9YZCN7TtgArHW7UaqmocSDSv+g5NKHPBsd4HipQWUHU
 8Jjz/jl5+CxzNbAWzISMXvWGYrpWZ6xfolDejUm6lg1iNqJD7E7E8xMAl6PYIvsfdrel
 eEMQQrUCls+80CxJGelOFktduyuWRvTBR5jPgedudl1WlMvnIgl+1soq8sI3sGBFH35K
 Eum4PGCKSfkz5XlSgmAu8zWRH7yrK2rK4PgSASofMNCUziDQ4Ub3N2IhgNtv4P+mh0Ko
 YSs0vMGeDMyiPvLpAWInEf0SFvbwy1EGyJZcKRgWY5exrHKzr2d+JCDB8CmWGURntuvE
 FPgQ==
X-Gm-Message-State: AOAM5310wJTrFs3sByOiPBXrY0Gm331hV6lJ2wFplJSDgEFM29wvPdCd
 btjyD2WKOkjaHfAxvRU6PsaZp776MKJb4A==
X-Google-Smtp-Source: ABdhPJwMvkvj7BZGX3P2UTWRordBLNf/CrRzwBPyii2szA56dxaNYCBgFwp8iyG6NEUNXOdYmGc6Zg==
X-Received: by 2002:a5d:5603:: with SMTP id l3mr5164871wrv.403.1624373018768; 
 Tue, 22 Jun 2021 07:43:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s7sm21836915wru.67.2021.06.22.07.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 07:43:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0C79A1FF7E;
 Tue, 22 Jun 2021 15:43:36 +0100 (BST)
References: <20210608040532.56449-1-ma.mandourr@gmail.com>
 <20210608040532.56449-4-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [RFC PATCH v3 3/4] plugins/cache: Enabled cache parameterization
Date: Tue, 22 Jun 2021 15:37:55 +0100
In-reply-to: <20210608040532.56449-4-ma.mandourr@gmail.com>
Message-ID: <87v966rmco.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: cota@braap.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Made both icache and dcache configurable through plugin arguments.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  contrib/plugins/cache.c | 44 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 42 insertions(+), 2 deletions(-)
>
> diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
> index 715e5443b0..d8e8c750b6 100644
> --- a/contrib/plugins/cache.c
> +++ b/contrib/plugins/cache.c
> @@ -104,8 +104,17 @@ static inline uint64_t extract_set(struct Cache *cac=
he, uint64_t addr)
>      return (addr & cache->set_mask) >> cache->blksize_shift;
>  }
>=20=20
> +static bool bad_cache_params(int blksize, int assoc, int cachesize)
> +{
> +    return (cachesize % blksize) !=3D 0 || (cachesize % (blksize * assoc=
) !=3D 0);
> +}
> +
>  static struct Cache *cache_init(int blksize, int assoc, int cachesize)
>  {
> +    if (bad_cache_params(blksize, assoc, cachesize)) {
> +        return NULL;
> +    }
> +
>      struct Cache *cache;
>      int i;
>      uint64_t blk_mask;
> @@ -403,8 +412,30 @@ int qemu_plugin_install(qemu_plugin_id_t id, const q=
emu_info_t *info,
>=20=20
>      for (i =3D 0; i < argc; i++) {
>          char *opt =3D argv[i];
> -        if (g_str_has_prefix(opt, "limit=3D")) {
> -            limit =3D g_ascii_strtoull(opt + 6, NULL, 10);
> +        if (g_str_has_prefix(opt, "I=3D")) {
> +            gchar **toks =3D g_strsplit(opt + 2, " ", -1);

I don't think this works because a space will trigger the shell to split
the args - the only way I could get it to work was by quoting the whole
-plugin argument. I know the syntax of optional plugin args is ugly as
hell but this should probably use "," like hwprofile.

> +            if (g_strv_length(toks) !=3D 3) {
> +                g_strfreev(toks);
> +                fprintf(stderr, "option parsing failed: %s\n", opt);
> +                return -1;
> +            }
> +            icachesize =3D g_ascii_strtoull(toks[0], NULL, 10);
> +            iassoc =3D g_ascii_strtoull(toks[1], NULL, 10);
> +            iblksize =3D g_ascii_strtoull(toks[2], NULL, 10);
> +            g_strfreev(toks);
> +        } else if (g_str_has_prefix(opt, "D=3D")) {
> +            gchar **toks =3D g_strsplit(opt + 2, " ", -1);
> +            if (g_strv_length(toks) !=3D 3) {
> +                g_strfreev(toks);
> +                fprintf(stderr, "option parsing failed: %s\n", opt);
> +                return -1;
> +            }
> +            dcachesize =3D g_ascii_strtoull(toks[0], NULL, 10);
> +            dassoc =3D g_ascii_strtoull(toks[1], NULL, 10);
> +            dblksize =3D g_ascii_strtoull(toks[2], NULL, 10);
> +            g_strfreev(toks);
> +        } else if (g_str_has_prefix(opt, "limit=3D")) {
> +            limit =3D g_ascii_strtoll(opt + 6, NULL, 10);
>          } else {
>              fprintf(stderr, "option parsing failed: %s\n", opt);
>              return -1;
> @@ -412,7 +443,16 @@ int qemu_plugin_install(qemu_plugin_id_t id, const q=
emu_info_t *info,
>      }
>=20=20
>      dcache =3D cache_init(dblksize, dassoc, dcachesize);
> +    if (!dcache) {
> +        fprintf(stderr, "dcache cannot be constructed from given paramet=
ers\n");
> +        return -1;
> +    }
> +

Can we give users more of a hint of what's wrong? I suspect you'll need
to factor out a validate_cache_param and return a string that describes
the failure mode. Otherwise it gets frustrating to the user.

>      icache =3D cache_init(iblksize, iassoc, icachesize);
> +    if (!icache) {
> +        fprintf(stderr, "icache cannot be constructed from given paramet=
ers\n");
> +        return -1;
> +    }

ditto

>=20=20
>      qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
>      qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);


--=20
Alex Benn=C3=A9e

