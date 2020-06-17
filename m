Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 939F71FCB7E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 12:57:20 +0200 (CEST)
Received: from localhost ([::1]:36998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlVkt-0002X3-Mt
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 06:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jlVjx-0001gO-2k
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 06:56:21 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:39475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jlVjt-0004D2-3j
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 06:56:20 -0400
Received: by mail-wr1-x441.google.com with SMTP id t18so1839508wru.6
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 03:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=a0B/FqwOnuHq8C38HweREEACIzbXDs5q4Fu5+QlGnJ4=;
 b=NnZzvi2cJoLjeirtDn3L0BiqdHGN6KZpSvHyP1Th7eeVcqkBp63clyC2cRdcvJiPiW
 Q9sqUDVuq7wierrOHFkk2J1JUjbMQPDtF08tNilWW2/DNtcwHjvtBiaNvev/NXedmU+o
 0xSKxfunKDWc879YCusHJWpnFbFctkV8OxWnnGqj2AhOlxP5zf76uSADTXs18fXbp1m7
 KmTXt+In/L+urD2vi7/wTTE74C3pZyOV/8Q0saYJDaMFS1g3CjpmZlR/RrKTNqgkanC5
 NtBh9nzRVGonlPdj+Ht6DatvQ+gI0DuweM6uAJJXHwWgizF6sXSOkPqRpBauAOTgJiDF
 qowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=a0B/FqwOnuHq8C38HweREEACIzbXDs5q4Fu5+QlGnJ4=;
 b=YntI0BVzxEz5AHgrfENzrFEtQP2+GRsMgrWDjb5eW6dYvaYmTBHqZhzPo+3H+QXIda
 zrfp03eshP2J480j7TLfJN85dutjqpDKudTAu82ZVR31U5nIneqU/jTuVAqsNmjTwsMY
 owzQ4XX8aJtEtTGOL3xoGTJ3CPlilKAhrYM0m0GYECeVuaMGqg3S4mDgJ7E0ghq4YwzZ
 7zhufNJ85iNqvFEDciYu6NDXtO0mR/ph4YHYN+lyHSFllk7+qKYgeYurLPaeR1WGQmcu
 MUzwCuwIiBn4eg+IQKn1taTsKv9605qZCXzLdZrD2r/IFtbsy0ZyU+1d6EL4FbK9zUWu
 /LCA==
X-Gm-Message-State: AOAM532EGKsfgCyuVEVFumwmxZXr6QrxBaOrgCuRxMz2IMl5hO8Rp8BH
 Nw6H1xZRbqO/BhjJXibJkH7Csg==
X-Google-Smtp-Source: ABdhPJwFjEziJQdOM5tHNfnmlH84ySa3HU8Tk8OuRqoAC0Vroe+YmZIMCFla6fV9TDyfkioL2FgP1Q==
X-Received: by 2002:a05:6000:12c8:: with SMTP id
 l8mr8079591wrx.148.1592391375600; 
 Wed, 17 Jun 2020 03:56:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j5sm33708542wrm.57.2020.06.17.03.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 03:56:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B3B1C1FF7E;
 Wed, 17 Jun 2020 11:56:13 +0100 (BST)
References: <20200617043757.1623337-1-richard.henderson@linaro.org>
 <20200617043757.1623337-4-richard.henderson@linaro.org>
User-agent: mu4e 1.5.3; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 3/5] configure: Clean up warning flag lists
In-reply-to: <20200617043757.1623337-4-richard.henderson@linaro.org>
Date: Wed, 17 Jun 2020 11:56:13 +0100
Message-ID: <87k106x8oi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Use a helper function to tidy the assembly of gcc_flags.
> Separate flags that disable warnings from those that enable,
> and sort the disable warnings to the end.
>
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

