Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2745C3079E7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:39:29 +0100 (CET)
Received: from localhost ([::1]:58888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59OK-0006Le-7r
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:39:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59LO-0003rX-H3
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:36:26 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59LM-0001yk-MX
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:36:26 -0500
Received: by mail-wr1-x42c.google.com with SMTP id q7so5800071wre.13
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 07:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=R96aex3BeRlnbGWuyaG5aOeSbhb8ZV1yDxpcDjjujdw=;
 b=gYpSa9BnhbS3x+vyxGI+deD0m86zXpCSz4rY7ypSMJDRqlKAvddN/aVEGJVIzIk89T
 M6uhonNxoY7Me/JUy8uHZmoNr71QK0Ja6XDwMi5k9/7p5LvVyGEvAo//W4VPy5ImkOwr
 QOE81+0uGw6tWosPsaw/SreW7qaI5O0zPJhhhojs+kMVvpRpq29S6Mf8VwDyF2LcWvEt
 WuYCTcANlN7H8Et3pe+a2jw67hsSu+VRv/A9JKck0p93IfhYfCBo+I24+MbTkQBrhwpk
 QDmtkOYyvPyBFo66fbs5qBj86nXDALqEY33fRa2V74b8h+Pu4ZjpkjLUN9FexueKQ46H
 UvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=R96aex3BeRlnbGWuyaG5aOeSbhb8ZV1yDxpcDjjujdw=;
 b=dzQWFTMZ8usVj/fJiUW9TzAB1ZSPiY1B3Q0Ig+IxzU9/q+SwQfkC9fIlhe0GvklYfY
 N1mF8J0hJSEWxWyNco5R5LUHZxRI4J1YGz2F9iCG1Ma3FSruEjKNfPqeavfe9DM6/PI4
 yOi5rHSh7JH47PF592AmZl+SkDnI5qcSOZnQgG4tPbD30GDq2ra3YhouFOZ9O6WcezQ4
 uaQCWH9Yn3ESwu9yCSRacpdbNlwQUFjwm0aD0CnD17nqzWxLtqr959/dEBpzBK5632+3
 u/iFANDjQVea1F0KQ62ZPPi1VtHhVHwK++bcA0Ixl1OdR/jBS3UAfS4CuhASujJZeKMS
 RysA==
X-Gm-Message-State: AOAM5305IG0DvWQ30oqGlhUWLEFpEbjHOdlZPA8W16m2W7lNpv6T/DdQ
 MHaon9o+6ny4JfITidN7oSP/HQ==
X-Google-Smtp-Source: ABdhPJyGcpJKRqw0N+Fswx7hqyHqBZrPq3iKS7LdDUtpqWgRTBss2bRIEIRwnANjDvJKncjQFVuBZQ==
X-Received: by 2002:a5d:460e:: with SMTP id t14mr17486093wrq.68.1611848183020; 
 Thu, 28 Jan 2021 07:36:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j4sm7271012wru.20.2021.01.28.07.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 07:36:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 358261FF7E;
 Thu, 28 Jan 2021 15:36:21 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-22-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 21/23] tcg/tci: Remove dead code for TCG_TARGET_HAS_div2_*
Date: Thu, 28 Jan 2021 15:36:16 +0000
In-reply-to: <20210128082331.196801-22-richard.henderson@linaro.org>
Message-ID: <87mtwtul8q.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> We do not simultaneously support div and div2 -- it's one
> or the other.  TCI is already using div, so remove div2.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

