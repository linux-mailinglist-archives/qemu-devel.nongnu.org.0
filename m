Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5326CD8F2
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 13:57:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phUPR-0004WJ-Sd; Wed, 29 Mar 2023 07:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1phUPL-0004Vd-ON
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 07:56:03 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1phUPK-0001B2-CO
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 07:56:03 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-54601d90118so132682497b3.12
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 04:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680090961;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1kiKtpZt/IsTevOFxyO7PDh7wKO2Tx48ldxYuBYLmWg=;
 b=hR9hBu8MiwbDkiBBd3+V+C4StxNudo5PbxuJexCMFIFn7wDuBZuV+vJxfV2ha648Cq
 seiKSdIvZL/iRSSLZj+7e4YJM34nA4uLx9EtsV7N8t2CiuyTylXyuSu1hB1SqeF167Q5
 0nfQ8ndXk31jW8ZYrSfr2ndW9+D46U/BM9XtDfWDCyds5h/DRGZXWO2vkMshzUu2y7TG
 AxPrPEmpnfr6HxG2L9Ds0LoDbaNSt3SOp4CBzLlMblqftaKvt4HXZxqdelUjWeZuoTxS
 VM4Rw4HW4Sin51I8moVMTVIYUTAA5jaK6h+vlHbs0XSeOjzCOfW4d8+QDaz7uuC6kpSf
 N8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680090961;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1kiKtpZt/IsTevOFxyO7PDh7wKO2Tx48ldxYuBYLmWg=;
 b=TzkHHtrFnzG2JDD5gdMVoQMkRQsPfzQucAI3XA2HP9M1zh+MOgl0FfmtEphA5NZiU2
 bVIzdfi/mO8Jr74aQ+IlTdDw6KpPSk/XA/keLuf2AnVNAnCguI8EMsrcY5lx+lgDexac
 MhEYgzs93j/DOyKXZYgbXk764SV6eEPXV2UR4IEuYZRwiu/qyepubz5o9+kJRsCKUh0h
 iHCp98VWbp4eLti6t09KHXN2Medd2zq8pz+kXDUInQQVQmV75Nd2I4ycJX7BN/IrbH+i
 5zwz9gFV2kW8RQy5SWffhODkHIMNuF/DjSVvZZENM0Ksp+mSFhbJ1RxoG3MH13+HuF9r
 8dhQ==
X-Gm-Message-State: AAQBX9f2N/VAoMDHvdcoMb5p1TR3OYHhSvdGQQKU/00u+OMFiO9PHP6B
 oQmQ4WG0FIJ7CuPSRB9K5Hd7bcXAo2PT0xOpAGw=
X-Google-Smtp-Source: AKy350aJMgq7Q0HRQafcYdct83EOLxk68OJAku3lrQlaU5hg9eMSzdYOJCEJE33Rqozpi+nCxlnhDG3gBnpXBJLeDsA=
X-Received: by 2002:a81:a7c4:0:b0:546:264:a375 with SMTP id
 e187-20020a81a7c4000000b005460264a375mr4140410ywh.4.1680090960862; Wed, 29
 Mar 2023 04:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230329092349.3722039-1-alex.bennee@linaro.org>
In-Reply-To: <20230329092349.3722039-1-alex.bennee@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 29 Mar 2023 07:55:48 -0400
Message-ID: <CAJSP0QUk=EdqMcvZQ8dNv2ShDfqYL8TWg4qK9sYksjXNOe3ZSg@mail.gmail.com>
Subject: Re: [RFC PATCH] scripts/coverage: initial coverage comparison script
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com, 
 f4bug@amsat.org, pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com, 
 Kautuk Consul <kconsul@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1136.google.com
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

On Wed, 29 Mar 2023 at 05:24, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This is a very rough and ready first pass at comparing gcovr's json
> output between two different runs. At the moment it will give you a
> file level diff between two runs but hopefully it wont be too hard to
> extend to give better insight.
>
> After generating the coverage results you run with something like:
>
>   ./scripts/coverage/compare_gcov_json.py \
>     -a ./builds/gcov.config1/coverage.json \
>     -b ./builds/gcov.config2/coverage.json
>
> My hope is we can use this to remove some redundancy from testing as
> well as evaluate if new tests are actually providing additional
> coverage or just burning our precious CI time.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> ---
>  scripts/coverage/compare_gcov_json.py | 118 ++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
>  create mode 100755 scripts/coverage/compare_gcov_json.py

Cool!

Stefan

