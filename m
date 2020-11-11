Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40AA2AF358
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 15:17:32 +0100 (CET)
Received: from localhost ([::1]:56524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcqwF-00025y-Lz
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 09:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kcqvS-0001aM-QK; Wed, 11 Nov 2020 09:16:42 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kcqvR-00075t-65; Wed, 11 Nov 2020 09:16:42 -0500
Received: by mail-wr1-x441.google.com with SMTP id d12so2638458wrr.13;
 Wed, 11 Nov 2020 06:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KWQF9qeDpUHxaMbouAse+iS0QpuRdg7aavZrsTGyfpk=;
 b=SuKRWS4sbYTqUfQCfJcGA6qMaFawT3fLnwJwvN+wGirY5MqS0Kl2uob3XVOngt8Pnb
 ycoxPtZ9oo9M5i3tEM2Gm/jIoZda3dKG0iFunKlXf0JpkczPVl6T6TAWn7OBI8nSSDpB
 jYtLnhh9u7OgWjpEloG5ZRoZLeA8fzHHqHl3T6iNaExIdTSENeyDG3veXuM0gaqb0lMz
 NciWulQGZRQu9cSzQCGFy5i+m/FkoQ6d3rk4tb3fsU/MPd8IbGb5OYsbIKx7WIPn22qT
 Nf/EjbkeqjnShZ0mLBYe2DEH/IBoT7oXtHoA3AZZKu0C6unFNMOn32l4R0abEEI6L8V0
 ARJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KWQF9qeDpUHxaMbouAse+iS0QpuRdg7aavZrsTGyfpk=;
 b=k3wqVxTZXfj5+VBz4ORxGTJHlNeuDTqHhukhsNDwAU3/7JAddU8yHgSVvAtm3OInya
 Sx59hBfNN+5FhI+4BiCkD+T/frgLqThFO/Nziq0VDj+ukPqTGTNFf8H26KZLjaPfTRYr
 v1MPJ71BIhsf9Xe12J3HyzRtnnlxIqpwGywT9qipndoUnptB/T+OO0VL8o8Ka7kq0rHn
 mcd4ilEo6pBy0SayTpghRDZV0YpeYQlFxj5aCVhLqAgp6CwwMH79kTcT55KWH6nP7Mmv
 /QM89fKgswxlv0yL+r7GmJlpjBYC+5spfuXAm1rDfKH6Wmx5UMtmKL67Kibsq8xO8+pD
 pr4Q==
X-Gm-Message-State: AOAM532twgdFfecbyS8HMy7/a6qNJYaP5XHKG1crvQLPSwVcz5FELR6L
 lrn4pJs9zWdUT2THi7W/KE0=
X-Google-Smtp-Source: ABdhPJwcnBazdBLGyCPlHQ3NL7BGA3RetTGhRR4nIPB5RaqHB5AeWiUlWpIaCBSW1r1rufYdzQYfQg==
X-Received: by 2002:a05:6000:1:: with SMTP id
 h1mr22953891wrx.127.1605104199055; 
 Wed, 11 Nov 2020 06:16:39 -0800 (PST)
Received: from localhost (85.9.90.146.dyn.plus.net. [146.90.9.85])
 by smtp.gmail.com with ESMTPSA id w15sm2751445wrp.52.2020.11.11.06.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 06:16:37 -0800 (PST)
Date: Wed, 11 Nov 2020 14:16:36 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/3] vhost-user-blk-server: depend on CONFIG_VHOST_USER
Message-ID: <20201111141636.GA1398106@stefanha-x1.localdomain>
References: <20201110171121.1265142-1-stefanha@redhat.com>
 <20201110171121.1265142-3-stefanha@redhat.com>
 <f04f74e4-ab6c-6c06-d4a9-cfa578bb16e0@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
In-Reply-To: <f04f74e4-ab6c-6c06-d4a9-cfa578bb16e0@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2020 at 10:25:22AM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 11/10/20 6:11 PM, Stefan Hajnoczi wrote:
> > I interpreted CONFIG_VHOST_USER as controlling only QEMU's vhost-user
> > device frontends. However, virtiofsd and contrib/ vhost-user device
> > backends are also controlled by CONFIG_VHOST_USER. Make the
> > vhost-user-blk server depend on CONFIG_VHOST_USER for consistency.
>=20
> Possible follow up cleanup is to rename variable including
> "frontend/backend".

Yes, vhost-user-blk-server and related names don't follow vhost-user
terminology.

Stefan

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+r8kQACgkQnKSrs4Gr
c8ifHQgAtk2lCzjYaUfIJyMeFmialjcWf3TcgLL332ZVh3F7N07MdLtZiXMQpifZ
k0fn18wDGy42PMiLXTS2K/cCp2qSjVIn4UuN79cXwRFTaWQ1YFgXMFVkNx/aTjDx
xpyPi+Mr+UUYW0YiCnrju9xUP9E9gcCqOdPizYXJii+r4GFgN7SJELKFTvvHJNxs
N8CVCN4R0iDAqLCXNyGRk2P36k6b1ibOvog+3wUxUaGa61hakTWporel3gBWuNT/
l3TeF7CVMUI7USn392lL+umRD+wzicJTuO15VYTZoPlqcpjvi4cYGxO9Khp5odsc
xhW0YhNkXddPbiPT1+tL7nYZXqeRLQ==
=+nWt
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--

