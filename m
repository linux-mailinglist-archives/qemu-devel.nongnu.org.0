Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171FF6DD7E4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 12:27:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmBDU-0001w4-Dq; Tue, 11 Apr 2023 06:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1pmBDP-0001u8-Qn
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:27:07 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.216])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1pmBDO-0007C9-0f
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:27:07 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1681208821; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=CaSk8OLSV2UUrnf2KsRNeeEpB5NCpzxrcsXT7TwPl22uH2xszxXEsWlkRBqtGOS+cr
 /GMkIF64A3eUF+5apQ+J1DQ+VeHGwaLpnNEbdZ5p4oFmXVXTH6E9WL/PjRnTXFidk9+u
 1E+KmTnZfBLv6dL6K3tGNhC3gW5h9OZC66E//CJ3LyUtBqdedM+JUr4ywN6Hwv5LWlgp
 1NQgbIYoUglfSf79kL1ygo/j4p//tI62D+XPpV4gfwoifgFndd7Q/VPkTeYHO0eJ9DBA
 llr2RHC6S66XM55v+SWcfR3rIvqBrNsIV6QdXSrKJs2ZyBqLAzM01tPSIzrx7NfTzPD3
 pdzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1681208821;
 s=strato-dkim-0002; d=strato.com;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=IuOkuny3OoUu/MkxuSE6WQ5Y90jBBlzMcNiGBEv5atQ=;
 b=XK/VRBbKEsK/xIb6IpQyMPlm0YrIPuwyos6wzt6gyo3U8+qOG56DBuTkwBgEJSbU5l
 u+uSHcASaNK8Vj+Qu5rg/wZVF1Z+sqM+m4nJ17ZMzOX45VTOE0VFteF1Utbj0juAK5N+
 Kau5Xz4PO671+cS5fFgJtm4agkQCQ/17IWgCAIZ2JpJ35Rdd5z7BCOaclAWBjzNS8XGj
 8yVY4gJOBtd3YjZ5tho/dHEg2U0BG2vzZYwscVTyMAy5xYVMHdOqiW1sGQk1II+Aw05B
 K7He8/X/BE2+aJslc9CM6UxYp0Q8GlTuHBpy2rRxyn3Nz+s9BKfvVx46nj0B9p7QGLRh
 TG7g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1681208821;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=IuOkuny3OoUu/MkxuSE6WQ5Y90jBBlzMcNiGBEv5atQ=;
 b=Aofq2CEifzoKr9eMwY5apUDXUpu381IMtpovn9DyW/RHln8081F+0znghqKqOKn2QJ
 F+ylQ4h3mwEbgZsEzkANvBdAjREria+60Wcr8xBuFIY+C6b3G7sp3ZCJFaOpeFqHrn5l
 eOVCVE76VOiunksv+E3YM31KqzPwBwzWu9+uLGQwTo/Okvc/4sW5V6H18TQlWJOdDtJx
 RXUmW8ueaIuBULTuqeIV6EzCPytmaHQ/KGwhg28TczVFBHFLFw2iozYCrftrTC/1+70X
 dOeBuzq6f5n0Gc23IslZYhQdYaUhcNM/2JFSHt6SDBdoeC6cwc+77VmfoRZfH03QhBEL
 zrxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1681208821;
 s=strato-dkim-0003; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=IuOkuny3OoUu/MkxuSE6WQ5Y90jBBlzMcNiGBEv5atQ=;
 b=oUjF8HFuPEobdyaFkNaSsvav4NTxaDZNRcIzKNKynbnstBAYO12vYSYUVnMEnhDFlF
 E0wLSS6KWz+j5zSJUVBQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5AEWIPBvsPI52f2TnxTwFPmhSWhc+9ByBCFU+BA=="
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz3BAR1Mf9
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 11 Apr 2023 12:27:01 +0200 (CEST)
Date: Tue, 11 Apr 2023 12:26:47 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] roms: add back edk2-basetools target
Message-ID: <20230411122647.3302155e.olaf@aepfle.de>
In-Reply-To: <20230411101709.445259-1-kraxel@redhat.com>
References: <20230411101709.445259-1-kraxel@redhat.com>
X-Mailer: Claws Mail 20220819T065813.516423bc hat ein Softwareproblem,
 kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c39xOJx.jS3sekHRsZkDN_p";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=81.169.146.216; envelope-from=olaf@aepfle.de;
 helo=mo4-p00-ob.smtp.rzone.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--Sig_/c39xOJx.jS3sekHRsZkDN_p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Tue, 11 Apr 2023 12:17:09 +0200 Gerd Hoffmann <kraxel@redhat.com>:

> +	python3 edk2-build.py --config edk2-build.config -m none

Is '-m none' correct?

I think previously the result was just a native build.
Now that introduced .config attempts cross builds.

Maybe that detail must be mentioned in the release notes, and the build req=
uirements.

Olaf

--Sig_/c39xOJx.jS3sekHRsZkDN_p
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmQ1NecACgkQ86SN7mm1
DoDd0A//T11zdf1jf8Fk3Q9Yq+utr8YNx2DfYUKf67B6vwKJJgnK2ivBab3+nkWl
oBTXgnqQrL/jsVqrqaTe0UwLSt9QDzqgROSKsc3u2EAGFIgO/WXpkkEUc+yln5tn
KBrX41sAOa7+5Syzy85u5NGx+kcM/QFUlYSENh4CvTU1WvENizBsFM/jTrFsoVkd
74CsLB07u7MVt8lix9v0ni6w41rxV02mRzW15Fral2hT3Ao2D5TkKi3d+wLOWzg2
OvjKvlIUFK6rPKB4eFIgf61cHMkdFGnhgtIV5rAA7HLWxwwVzKxdUcCwSCSj6dDM
Tq/5J1DuiqE5aqplXTXDf5Xl1jODA6sKe/9R6WakwSq0J7Npo371CdKsi0LjY0sh
4E3FuE1o3+fXeKl86CEiuOH7zRVnDuAt+b4rUxwMyYsZmtWuqwZx4trmgSOLOMYz
OrgKA9IitqrrfUIKx5jo7uL3bM6/kTeYnj2Fe/r5FEwyLLGZmnA2R8jhu9cEm3w+
0Ykbl6eIMYZXEYCDPpupys+49l1341cXac7twsj4pe466rP6MKAjyS+je7B7tmPK
MCUN3cGDSVTc9YWgf8nYYIjB6/Ee0QwvRoXqXx7EA3p4XdAcdTpz6gZynRSCNge0
u1hg5QF1WpbANZlwNAB2QkamLVM228KB7bpYttamIMhRZk9SL9w=
=Ktt2
-----END PGP SIGNATURE-----

--Sig_/c39xOJx.jS3sekHRsZkDN_p--

