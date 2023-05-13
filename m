Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54263701435
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 05:32:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxfzR-0007Xa-Au; Fri, 12 May 2023 23:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pxfzO-0007Ws-D7; Fri, 12 May 2023 23:32:10 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pxfzM-0005MF-PI; Fri, 12 May 2023 23:32:10 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-643b60855c8so8724641b3a.2; 
 Fri, 12 May 2023 20:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683948726; x=1686540726;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EzqS341PYNRnnPro3VthVm3iCTEUcsYNw0TZxczt2Rc=;
 b=IbHmZxBHxze4a2PRafjV34Mw6hiGgOpGszmSWd48EOGR1VLBOLEGLDeFOjVdb0V8rO
 TUSxfzLFPGaS7MwymyHtXzz2fx96KOJpdXACWyQz2A9e7TA7ej13Caq3e6at9NZ6VHY3
 kzkHvKlzjfXq9XppwOJMFXROtFRnFlbynsHGcQOtlEEMMKHW6/eKmpFNJYXnDL2TMpF9
 lwHBnLf1VNsUX8h0pd6zVo0sBs0auQW3QTFNvNMQFdVAqwZgpZqXk+iZmdPVKoVE7Qkt
 4viDMSWbsAnrxI3Iks9eWX8S8WZUdd5lT7LtRhGpHZrW8SlAUrN3auT3WoeDl6XRY4Lv
 SWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683948726; x=1686540726;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EzqS341PYNRnnPro3VthVm3iCTEUcsYNw0TZxczt2Rc=;
 b=N9WfQdaUHH7iIg0Zfu7MDFHCpUaNEeP02ssDej62iXU0gxWxk5AD6vMDOwxZUeN5NY
 Tc0wYyzKSN6lDDSIZNw45UNsjDV7UzUigiYC4xyLmrYxkYvvgHviuMUbAqbpeHVEUdpX
 JWv9VLY8Dk1ZQ0ZfpnJ/pZepsrjeh3y8wVeBtE6rHTFENhlUenhh+dGBQiB4LB2tiuq5
 qpcenbQ+jYDPnFRj1oMkISBj5VdIbIPLnM9yAA7rdPA2aUVEA+NE4n66pRzQN5jR3tlF
 9CdKmbfWn9maa4Rod9bto/kO+ZmfmTUyREiXxOtfLNx/FV3Xp++Rumb6IKQ2L6uAdBCi
 yfFA==
X-Gm-Message-State: AC+VfDzKk8j6NgPH/rVLtyy7MVU0lwYXBTMl6f3UyJieeF45SZwjJsJl
 VcMfaHT66WjKrYdN4GxC5WJg/HXLTdM=
X-Google-Smtp-Source: ACHHUZ5vZ6soyCYf7rGTBlw7onz7pAiWANRdyOkMPZnX7JnDdi60Rol6HbVRPdcy6atwsxk7YG73BQ==
X-Received: by 2002:a05:6a00:16d3:b0:63d:3f74:9df7 with SMTP id
 l19-20020a056a0016d300b0063d3f749df7mr32311308pfc.34.1683948726420; 
 Fri, 12 May 2023 20:32:06 -0700 (PDT)
Received: from localhost ([1.146.114.250]) by smtp.gmail.com with ESMTPSA id
 y16-20020aa78550000000b0063b898b3502sm7738851pfn.153.2023.05.12.20.32.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 20:32:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 13 May 2023 13:32:00 +1000
Message-Id: <CSKU02SMVA44.82WP8MS5AJLB@wheely>
Cc: <qemu-devel@nongnu.org>
Subject: Re: [RFC PATCH 4/4] spapr: Move spapr nested HV to a new file
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Harsh Prateek Bora" <harshpb@linux.ibm.com>, <qemu-ppc@nongnu.org>
X-Mailer: aerc 0.14.0
References: <20230503003954.128188-1-npiggin@gmail.com>
 <20230503003954.128188-5-npiggin@gmail.com>
 <a887b256-a411-4c20-dea8-f86eeaf6f965@linux.ibm.com>
In-Reply-To: <a887b256-a411-4c20-dea8-f86eeaf6f965@linux.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Fri May 5, 2023 at 9:09 PM AEST, Harsh Prateek Bora wrote:
> <correcting my email in CC>
>
> On 5/3/23 06:09, Nicholas Piggin wrote:
> > Create spapr_nested.c for the nested HV implementation (modulo small
> > pieces in MMU and exception handling).
> >=20
> This separation of nested code in its own file is very much needed, but=
=20
> this could have been a pre-patch to all the previous patches (at least=20
> 2/3, 3/4 which are debatable).

It could have. I don't mind getting it into a slightly better shape
before doing the rename but I don't know if there is really a one true
way for ordering code movement vs reworking.

Thanks,
Nick

