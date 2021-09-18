Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CBD41033B
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 05:26:10 +0200 (CEST)
Received: from localhost ([::1]:33670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRQzR-00009L-BP
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 23:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mRQxx-0007vV-H5; Fri, 17 Sep 2021 23:24:37 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:46077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mRQxv-0007Zc-QD; Fri, 17 Sep 2021 23:24:37 -0400
Received: by mail-qk1-x72f.google.com with SMTP id a10so23670249qka.12;
 Fri, 17 Sep 2021 20:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=SvosS/8cUWjhQlmkkbYdCSvfIoScJ7qppki74bx+kqM=;
 b=qFWlIxIlR/NXNKJHX8l4+9HIb8fbk8cLNN3mGt/8mc1yfX3+JhzJDrK9Ej+J7BW7r2
 I360qT4R3wuDukutGHts5osvWLHseXdZ4zeQbg3EYD7nW7K6syIE6KoJjlJtQDlwLtbo
 j4S4g0OkUnf6yd1tMAGjeCHFguybZOLciBX7+CQ7fF1fPS9c5sglatGlEKMDdBHJVM+9
 K08LI/hscevEJEZJl5BVP67zQXUIHjiB5dv3RaVUO+13QVFIVXaeWjodAtaxgR+GiiNC
 nElIkRFvozeEemG7LWed0tYqxNm2gBTBaPPLQGP7hOnmk/SYzpCsd0LDeST3aVZT9Jcz
 C72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=SvosS/8cUWjhQlmkkbYdCSvfIoScJ7qppki74bx+kqM=;
 b=KDMxnrvrmXm/kqrZO5UMQ+v3Y6hWuy0Kn+7PEKRCEkz2nZxyMUtiopCDeIK6n/Dv6V
 n0BMuTxiMjesTEgG4vDtIDWEbO4UZqj26v5/31zfukVYA+NVrOdMV1Yjy7wHnUUrsAKI
 RNhTRGH5360tGa4hj1pKbilM9VXkkGiPW/+qMTp9pbu77GCEzTE4EZ+NwdR9l0Yg730w
 5rq/Y6mA8gfmo0p4Va920wy7l6MLFrm3ERWAGnXwOaWhM9Ln+nxpxi8ihP2tX+RLIquE
 VohnDT8oGR+GcB1HKWLgAfyptoUoeyyvWtZT5+8B8WEYq16ZoBsncyCEZ/S2rGYjfjlM
 iWqA==
X-Gm-Message-State: AOAM533gzT1yki98alwpYgf0HAxkHGITmdAfWTlWGtPgF/+AHlowwvPk
 ZVFmyeMGoz9RnDpOe6vwWuIiF5i6Itht97dWuO8G0cMz
X-Google-Smtp-Source: ABdhPJz7RejCXZVqDO4LJfnTvKgb5ZlsVpD4E6bjX0v1aOIgNN4IbXyCoHa4ZV6ubeJCXg3C2vSJkHnJBXeKd/lMJN0=
X-Received: by 2002:a25:83:: with SMTP id 125mr17900849yba.467.1631935473801; 
 Fri, 17 Sep 2021 20:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210918030149.642398-1-bmeng.cn@gmail.com>
 <20210918030149.642398-2-bmeng.cn@gmail.com>
In-Reply-To: <20210918030149.642398-2-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 18 Sep 2021 11:24:22 +0800
Message-ID: <CAEUhbmV=uPQnFFbWzfuHT06JJ-oiF+UuBAtuJ+KjeyGOP7uEnA@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/intc: openpic: Drop Raven related codes
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Sep 18, 2021 at 11:02 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> There is no machine that uses Motorola MCP750 (aka Raven) model.
> Drop the related codes.
>
> While we are here, drop the mentioning of Intel GW80314 I/O
> companion chip in the comments as it has been obsolete for years,
> and correct a typo too.
>
> Signed-off-by: Bin Meng <bin.meng@windirver.com>

Oops, email address is wrong.

Please drop this. Will resend.

Regards,
Bin

