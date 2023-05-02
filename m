Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59C46F48D4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 19:06:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pttPg-000484-BM; Tue, 02 May 2023 13:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pttPe-00047w-Jm
 for qemu-devel@nongnu.org; Tue, 02 May 2023 13:03:38 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pttPc-0006TN-EO
 for qemu-devel@nongnu.org; Tue, 02 May 2023 13:03:38 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50bc0117683so5701200a12.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 10:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683047012; x=1685639012;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=etK2EUqyDvngx3ecX4GnWW300M8Ntg4u2ykyJip5KwY=;
 b=vxX/JwaABRqlDtARqpu7Od+tdSf3pSMREtsKDcNq4JTZKUAksDLDNSm8Wq3c7Eajwl
 An+e8XGsIwOG+cHSrtdCOIz788OVzr5fZImBeoj4cJDCq3aSbAQ05lgCNvtHksO/diKV
 DDKMO7ztc7Lw45lEPoeVqO1cRwm+0CkKUZrOUV4Qld9dWkiXJYETLKSvawYEdmSa8Z9C
 uR+JwGohSZxOiNKTdiEWdb8C5eKkVcawO+CM1RUhKaMEXYzv0qopaFKlF/H4WsFi+0L3
 a2CqkosC/jh3nhWaZZ+1nn5XN2udbSQZtWD43wWS6oHjKt88Dzacek+2Y1FUOTAcyJHD
 kdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683047012; x=1685639012;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=etK2EUqyDvngx3ecX4GnWW300M8Ntg4u2ykyJip5KwY=;
 b=kMRfsTUpHAU57Bhl19ltO3vuJwh2iYgEPEeu/IiLkTRgiPbufaJlM1PCkxp5185X87
 vbR/D2HNtfk5GMCIChC5DT7x8Zh/wlCW7qQXWyE7aIeQchWvY4pdfmnzc9GgsUinH5LF
 PsTU0EeG9kGhva/C9yQA9ERQ7bW/M4LuMf5YFwBfB7vHM3eKYRdEY7Wn2IyyggDwfbOr
 G+K5SNmw7U9nsJ1wqhDjz1zxINSho1YFCqY5e4SkShvgh7O8Mh781exrYQPTYBguOf/h
 HAb4Fops0ooh8yfbeHtpfDXvlnnsuVQHC3xdFIQiyK2ZBJrsKaO/mkTQBwMcRtOmU9x7
 8Qzw==
X-Gm-Message-State: AC+VfDwtd91lBfEQUKngSwm/acdf4vJr1hb59CDuGefyZa6iBj/vC7wx
 WUmxF0ALN1+k+B3bHuA3JztDh/UjcLulNtsQurluVQ==
X-Google-Smtp-Source: ACHHUZ5nM3fhL6M1N99jjRctT63gljOA+NA0X9aGevljgfpxQ4ZpKQQTg0TWpGdqKn1Nv1T7/pTCS7FTEK38PovygnA=
X-Received: by 2002:a17:906:fd82:b0:947:335f:5a0d with SMTP id
 xa2-20020a170906fd8200b00947335f5a0dmr602598ejb.62.1683047011876; Tue, 02 May
 2023 10:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1678237635.git.mst@redhat.com>
 <f2b901098e14ad1aaffab82464917b8679499cc5.1678237635.git.mst@redhat.com>
In-Reply-To: <f2b901098e14ad1aaffab82464917b8679499cc5.1678237635.git.mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 18:03:20 +0100
Message-ID: <CAFEAcA-ZKc1Q_rTH4XGNH+wu0cfJ5G2RPpEV=x0pitHNUnbe2w@mail.gmail.com>
Subject: Re: [PULL 11/73] cryptodev: Support query-stats QMP command
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 8 Mar 2023 at 01:11, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> From: zhenwei pi <pizhenwei@bytedance.com>
>
> Now we can use "query-stats" QMP command to query statistics of
> crypto devices. (Originally this was designed to show statistics
> by '{"execute": "query-cryptodev"}'. Daniel Berrang=C3=A9 suggested that
> querying configuration info by "query-cryptodev", and querying
> runtime performance info by "query-stats". This makes sense!)

Hi; Coverity points out (CID 1508074) that this change
introduces a memory leak:

> +static int cryptodev_backend_stats_query(Object *obj, void *data)
> +{

> +    entry =3D g_new0(StatsResult, 1);
> +    entry->provider =3D STATS_PROVIDER_CRYPTODEV;
> +    entry->qom_path =3D g_strdup(object_get_canonical_path(obj));

object_get_canonical_path() already returns allocated memory
that the caller should free with g_free(), so we should not
g_strdup() it (which then leaks that memory).

> +    entry->stats =3D stats_list;
> +    QAPI_LIST_PREPEND(*stats_results, entry);
> +
> +    return 0;
> +}

Would somebody like to send a patch?

thanks
-- PMM

