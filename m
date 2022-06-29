Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2113756022A
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 16:12:56 +0200 (CEST)
Received: from localhost ([::1]:32966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6YR4-0001vd-KD
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 10:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dominique.martinet@atmark-techno.com>)
 id 1o6UqX-0007WG-BK
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 06:22:57 -0400
Received: from gw2.atmark-techno.com ([35.74.137.57]:33486)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dominique.martinet@atmark-techno.com>)
 id 1o6UqU-0004Pr-Ug
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 06:22:56 -0400
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by gw2.atmark-techno.com (Postfix) with ESMTPS id BDDD720D72
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 19:22:52 +0900 (JST)
Received: by mail-pf1-f199.google.com with SMTP id
 x200-20020a627cd1000000b00525b62097a6so3401649pfc.22
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 03:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Iq5dQ9/oFOk95wiDytybT7/zGWLYnIE99nSYE9KNXcg=;
 b=Ho7Oj3TXXNGW0YO4YJ/0sXAk6oECjEYMp3QimXVq4EGRsBf68AhrxLyP47CIT0ZOqN
 /HQ3mToOW49avBIE3ts4JkMbpkwtHMcq9Xz1MwWsWf4lgKYidWeKlmpTtlNJ3/mydt/7
 7a9QLKSWAkia9XxkTX/azD5OTuY5WM4LkRzaglMao4Ig9fkD4tQREY3aYvWOr6Mv/shZ
 /cx84S9zWG5U2wpBAcpqfAgTR0TkMUn05XO+CoGAKT35Dc6rz1jV2yZEkAjdy6Mv+DWw
 /TbDzLsQb4hArn/knl6cuP8KR4GOf32twuF2ha1ndfG9gdkBghjw5o6MKsTishDnc75R
 WmYQ==
X-Gm-Message-State: AJIora84EjoB0GhcFJ8PAq7/B61Q4fxBMPgiEnczZKYSv7nZkbK9gt83
 UuVwnO7OalF1Pkg6aIfCVJWoo85TPTN2BQKW3StLvO8Qltl8WEnJqPeeBMH+aZGxuWf3YbYI7JQ
 TG6PlHE3sx28U7ckq
X-Received: by 2002:a17:902:74c7:b0:16a:1be3:b7f2 with SMTP id
 f7-20020a17090274c700b0016a1be3b7f2mr8524866plt.42.1656498171632; 
 Wed, 29 Jun 2022 03:22:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tIvJZyLQ+9i0duAM3ey5eLA5eP+CmKpPsTyRXQ7VSJJuOkoZkBOLLfzmYryIYRS1EqWHpgMQ==
X-Received: by 2002:a17:902:74c7:b0:16a:1be3:b7f2 with SMTP id
 f7-20020a17090274c700b0016a1be3b7f2mr8524847plt.42.1656498171382; 
 Wed, 29 Jun 2022 03:22:51 -0700 (PDT)
Received: from pc-zest.atmarktech (103.131.189.35.bc.googleusercontent.com.
 [35.189.131.103]) by smtp.gmail.com with ESMTPSA id
 s37-20020a056a0017a500b0052513b5d078sm11140726pfg.31.2022.06.29.03.22.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Jun 2022 03:22:50 -0700 (PDT)
Received: from martinet by pc-zest.atmarktech with local (Exim 4.95)
 (envelope-from <martinet@pc-zest>) id 1o6UqO-0091yc-7k;
 Wed, 29 Jun 2022 19:22:49 +0900
Date: Wed, 29 Jun 2022 19:22:38 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Aarushi Mehta <mehta.aaru20@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] io_uring: fix short read slow path corruptions
Message-ID: <Yrwn7iEnnR+yyoAO@atmark-techno.com>
References: <20220629044957.1998430-1-dominique.martinet@atmark-techno.com>
 <20220629052316.2017896-1-dominique.martinet@atmark-techno.com>
 <YrwRUEP0FktTmuX0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YrwRUEP0FktTmuX0@redhat.com>
Received-SPF: pass client-ip=35.74.137.57;
 envelope-from=dominique.martinet@atmark-techno.com; helo=gw2.atmark-techno.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 29 Jun 2022 09:53:10 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf wrote on Wed, Jun 29, 2022 at 10:46:08AM +0200:
> I see this a few lines above:
> 
>     /* Update read position */
>     luringcb->total_read = nread;
> 
> Doesn't it have the same problem? Though maybe getting two short reads
> is more of a theoretical case.

Good catch, I'll send a v2 with that one adjusted as well tomorrow -- I
had logs and can confirm I didn't get two short reads in a row...

I wonder if there'd be a way to test? E.g. act like we've requested n
bytes but actually only fill in a bit less in the iov?

-- 
Dominique

