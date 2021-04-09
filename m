Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0085335A1BF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 17:12:12 +0200 (CEST)
Received: from localhost ([::1]:56514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUsnr-0007td-2G
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 11:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUsmi-0007Dg-93
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 11:11:00 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUsmg-0007Tr-LD
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 11:10:59 -0400
Received: by mail-wr1-x42d.google.com with SMTP id 12so5986631wrz.7
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 08:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=KvlcLyPxllBKYpGw/pdmV71S54E9KWRF31eNolIjnrU=;
 b=jaFScpZDc3Y872jEPRaTP7qQT94FRuvsrViunoXdeGyw9Yyp0kB0mz8dEeGFuYagnJ
 HRXyQaDlGeUtrPGMDAUs2s/S1in8YlCgIULwikbciGqGMZP+fO4o5UV1W1ZepoC+M6nn
 l2LK/dIMlOeGyhTMRi9IbIdWQ/LS3SALxhx7szrHMMl95cX4F5lZx8nOKTgaeNo3wsn6
 t5kSCi9eHRbrdoTg8SlvRe7dcZZrtD51SKwoWDo1ZRWf3DbYz5CQVbjEX4Yk8hp7rmE3
 1GjiFuGX9et7LnsWY58Bl5y771eeZ+vpow8nUUx0BATeYG3zPKgpDFcfYj3mQTdlECyW
 QPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=KvlcLyPxllBKYpGw/pdmV71S54E9KWRF31eNolIjnrU=;
 b=G7cPsYEfV6T2yeoox34Wc2vsQo0W8dfHnBkKYoWKpYBhI4agluAwad7O4HZDm3z2V3
 OVXqpxErjTazQec3DGXBXpZWrE7B5X0aDwZd5nxZcx4R36NL/RaS4/fcAQIIOlDa5sKq
 StEyUw0CDyR1L47oQHre1ebvpIQaOikDc5TDFkDM/K84TjTybvUj+tv1Hu7lUkTw8JzW
 dIeDhM+6MgnXycgxZHJnLiDrjD5S79EctmwL3YegWNbIstT+pDTNLfrrAtZkOPNU/kS9
 nKC8WUygi8XJpCAE5dm3KLxncQT+r9PLzuqUAr5Xcq0ZpA+mWlPIrEHLpwyu41wmZefK
 VJXQ==
X-Gm-Message-State: AOAM531BmNtKVS604P/9dTjWJwRpasvCoSopey0Z3Kt+5Ts/rKEqw4F0
 mIsf9sV3W/nkiE6qsHvw32rcsQ==
X-Google-Smtp-Source: ABdhPJwv4PRghhhL8qsIFKgHUzaFMw8ZH85hRV6HTLWIzCxFUlt3nQlhAWqgQkPzHN2D0LnLD4abhw==
X-Received: by 2002:adf:e0c8:: with SMTP id m8mr18473196wri.349.1617981057119; 
 Fri, 09 Apr 2021 08:10:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v185sm4247257wmb.25.2021.04.09.08.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 08:10:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E65231FF7E;
 Fri,  9 Apr 2021 16:10:54 +0100 (BST)
References: <161786467973.295167.5612704777283969903.stgit@bahia.lan>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] checkpatch: Fix use of uninitialized value
Date: Fri, 09 Apr 2021 16:08:51 +0100
In-reply-to: <161786467973.295167.5612704777283969903.stgit@bahia.lan>
Message-ID: <87fszzsdc1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: isaku.yamahata@intel.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Greg Kurz <groug@kaod.org> writes:

> checkfilename() doesn't always set $acpi_testexpected. Fix the following
> warning:
>
> Use of uninitialized value $acpi_testexpected in string eq at
>  ./scripts/checkpatch.pl line 1529.
>
> Fixes: d2f1af0e4120 ("checkpatch: don't emit warning on newly created acp=
i data files")
> Cc: isaku.yamahata@intel.com
> Signed-off-by: Greg Kurz <groug@kaod.org>

jinx ;-)
=20
  Subject: [RFC PATCH] scripts/checkpatch: fix uninitialised value check
  Date: Thu,  8 Apr 2021 17:46:10 +0100
  Message-Id: <20210408164610.14229-1-alex.bennee@linaro.org>

but as I failed to check the list first have a:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  scripts/checkpatch.pl |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 8f7053ec9b26..3d185cceac94 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1532,6 +1532,7 @@ sub process {
>  		     ($line =3D~ /\{\s*([\w\/\.\-]*)\s*\=3D\>\s*([\w\/\.\-]*)\s*\}/ &&
>  		      (defined($1) || defined($2)))) &&
>                        !(($realfile ne '') &&
> +                        defined($acpi_testexpected) &&
>                          ($realfile eq $acpi_testexpected))) {
>  			$reported_maintainer_file =3D 1;
>  			WARN("added, moved or deleted file(s), does MAINTAINERS need updating=
?\n" . $herecurr);


--=20
Alex Benn=C3=A9e

