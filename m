Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 918FB4615A1
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 13:59:55 +0100 (CET)
Received: from localhost ([::1]:36682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrgGA-00036b-4o
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 07:59:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrgEf-0002Lu-5u
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 07:58:21 -0500
Received: from [2a00:1450:4864:20::434] (port=39801
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrgEd-0002Hs-RR
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 07:58:20 -0500
Received: by mail-wr1-x434.google.com with SMTP id a18so36620635wrn.6
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 04:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Bzwx2VMVMxASXARypUNNpeqqL7YlsGByLkHj+hW/F6k=;
 b=GvK+GXOf/PMSqMf0p8Adax/X6OwJvk2jT9prTaSC4NIcgYlOoxGe9E8qB7mLWS9pjj
 71cf1vu+0sPZ4zLk7WQi7L45DTqPsqiujuqunovAlruktJ0/CNzcje95/PHxfRVS5rph
 tCcqaCIyeMWldyZIIgAPsTbtn/il21HoDNB6qVfx5/gByBolk/T3YAarmvr+Bbwfr77C
 0ahS33HV6WQ7Yn0zOPw2HDddjgrKY9tFoWl00Ds9EPIc1XN6r3+sUWke3xziF0ufU4wT
 B3tnlplYUD/otkwJ/V6O/KIIBDUNBBN2GjFJZx6zKCGofhXnyvPsPO+vBZZUvmUZYXam
 BJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Bzwx2VMVMxASXARypUNNpeqqL7YlsGByLkHj+hW/F6k=;
 b=OdgGEzyo5Dn8RoSNG3s4R/9u0xiyZ0vzSnwG7PVn4F9eMb6BkP6FWLE4HaZGNlsHKz
 KHBUYvpKw7ItNZzZ2uXMPVYs+tOwD7j37a0oqJCKlpHd5iaK6KdU2c8aXPHOPO0Z5dVD
 i5Z49sjZk4e6njLQF10Qc03psyKOczi3joYI3iYeVdtMmo4nydOucuVoJYsTIv/bUi4d
 nzUvc2u8CJWkYkENXGHUODnQsX0HLNvF5bB+nM3awq1eW+e26y78ujb0jVUg7+3hQ46n
 6bpj4QiFFd/WFuS2VLwUheQ1avDw7TSuMipclJqCEWgogVVRshuvKoqVWV+t8oqkpWP/
 lqaQ==
X-Gm-Message-State: AOAM531vUsF4wqrV49Ta649pi6Jv/DEIzNpWK80UqIx8QuxTV0UBJXOO
 q0DAX548d8F8frzmEvV2TMt9yg==
X-Google-Smtp-Source: ABdhPJz0Ru6iVc4aQS89nfzPgb4N6iHdb9iBfkWmgImSKPoBlwiJ+hBTBdOvs/bokNv85nC+bay2HA==
X-Received: by 2002:adf:cc91:: with SMTP id p17mr33566493wrj.589.1638190698434; 
 Mon, 29 Nov 2021 04:58:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h18sm15088933wre.46.2021.11.29.04.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 04:58:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2CE481FF96;
 Mon, 29 Nov 2021 12:58:15 +0000 (GMT)
References: <20211128011551.2115468-1-juro.bystricky@intel.com>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Juro Bystricky <juro.bystricky@intel.com>
Subject: Re: [PATCH] tests/plugin/syscall.c: fix compiler warnings
Date: Mon, 29 Nov 2021 12:58:09 +0000
In-reply-to: <20211128011551.2115468-1-juro.bystricky@intel.com>
Message-ID: <87r1azyv88.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, erdnaxe@crans.org, ma.mandourr@gmail.com,
 qemu-devel@nongnu.org, jurobystricky@hotmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Juro Bystricky <juro.bystricky@intel.com> writes:

> Fix compiler warnings. The warnings can result in a broken build.
> This patch fixes warnings such as:

Queued to for-6.2/more-misc-fixes, thanks.

--=20
Alex Benn=C3=A9e

