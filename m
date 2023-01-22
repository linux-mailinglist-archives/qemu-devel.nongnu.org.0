Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB076773C4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 02:21:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJlVr-000308-Jy; Sun, 22 Jan 2023 20:20:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jjuran@gmail.com>)
 id 1pJifx-0001JD-MN; Sun, 22 Jan 2023 17:18:57 -0500
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jjuran@gmail.com>)
 id 1pJifw-0007dQ-5M; Sun, 22 Jan 2023 17:18:57 -0500
Received: by mail-qv1-xf36.google.com with SMTP id e19so4681325qvw.13;
 Sun, 22 Jan 2023 14:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ORmHjRHCwYxQlPSD6xeJ3RaZZBv/mi61G8/oCpAqJXs=;
 b=lXlCSk1gw6Ob1YjXOd/Ge4to3rUkicoVFT9hJf3AvT+IvIExzHqxCKUaFd/TyR9+QW
 5YF0Rmyfmq7+H4QoWcU3o67VRqsdhpVaAqp1G3djTfOlo/Ff9lQNCzw12qMjjoH1KVRf
 puSubl2Xs97g/SWLVnYsAwzFr4nl9YWBSTRqx6hfwB0rTojGVx1c0zpAbot2Wb1k1Zsf
 GNPxiB0Mf3e5h9XFierljl0ACOUyit7QtDIRLPYgaReuU7vVKJPw11Jr4b/zbgrUITyC
 ElYamZNniA5qkaWu5qUaZQI11Ob1S/GzlYA1roymfSpbpYPrfD4Lg0xZ5VXV13g0Fqsd
 rBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ORmHjRHCwYxQlPSD6xeJ3RaZZBv/mi61G8/oCpAqJXs=;
 b=3RkEROIvbXyqg0+3Amdfye/HtD9/6pmCZ+gkdrvoKkVx5dcEUtH5MqhP6Fx/MSRXxs
 XDEarasJXgrLKZidXN0pKPldNu/vdhAJXK2OyQuJyE1erPs+gfoVzTCOhR6ilzlqXz8u
 IHnpGLAlnC7E8eGiYQvkakNmMev4hM2mzYMgTMMOMo/aB4LxVHdUxXrpz1aXwLJxZadj
 ru60UzS6rpeBUJj9dZz2QOqTUOTvMUxnmeEoiD9kf4cd8MT8StIJjUxklBdxjHnEJpZf
 U7P7pZpAzF57hrrsYaMczyIX3w+r0Lw8qMHe27oOMl7lzVxivyKFIg8YuWEnORh8SlZ9
 WwVg==
X-Gm-Message-State: AFqh2kq1h9dCtjXZjjQ3EX2oOS2KNe0qUQSw967AChzC///TKXCc1EVq
 Bw3lWefX+eJpah6piOvV6Jo=
X-Google-Smtp-Source: AMrXdXsmWTZhke8vn4pPdXebE1BWyJYaZMjVe3XAPmeM3pmO2W9wi7ODYqyrb2HD3NNj3ZIX/hP0yA==
X-Received: by 2002:a05:6214:2f01:b0:4c6:e395:b702 with SMTP id
 od1-20020a0562142f0100b004c6e395b702mr39424079qvb.34.1674425934547; 
 Sun, 22 Jan 2023 14:18:54 -0800 (PST)
Received: from ?IPv6:2601:152:4d01:3940:d5e0:538c:8925:fe44?
 ([2601:152:4d01:3940:d5e0:538c:8925:fe44])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a05620a410700b006cbe3be300esm16299749qko.12.2023.01.22.14.18.53
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 22 Jan 2023 14:18:54 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Subject: Re: [PATCH v7 4/7] mac_newworld: Add machine types for different
 mac99 configs
From: Josh Juran <jjuran@gmail.com>
In-Reply-To: <32babb9f-7914-8910-bb99-307c3bc50e8a@eik.bme.hu>
Date: Sun, 22 Jan 2023 17:18:44 -0500
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <EFE936A8-229E-4C4C-A961-C371B7672179@gmail.com>
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <b8aa89c354027fc71cdb93b697b139e93ac05e25.1672868854.git.balaton@eik.bme.hu>
 <ece23a2e-33a9-d2e2-14fd-097878acfa1f@ilande.co.uk>
 <61305eda-439b-800e-2265-c2c48bc21be9@eik.bme.hu>
 <23f2ba9b-97b3-25f2-2642-667238f79d11@ilande.co.uk>
 <32babb9f-7914-8910-bb99-307c3bc50e8a@eik.bme.hu>
To: BALATON Zoltan <balaton@eik.bme.hu>
X-Mailer: Apple Mail (2.1878.6)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=jjuran@gmail.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 22 Jan 2023 20:20:41 -0500
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

On Jan 22, 2023, at 4:48 PM, BALATON Zoltan <balaton@eik.bme.hu> wrote:

> It would be tough to come up with a name for the powerbook3_2 though =
as these were called Early 2001 Titanium PowerBook G4 or code name =
Mercury but even Mac fanatics probably couldn't tell that was a =
powerbook if you call it g4mercury so I'm open to votes on naming but =
hard to be convinced there's anything simpler and more straightforward =
than using machine id which is usually also listed everywhere for these.

g4tibook1stgen?

("TiBook" being an affectionate abbreviation for "Titanium PowerBook")

Cheers,
Josh


