Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9695FC1C48
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Sep 2019 09:47:19 +0200 (CEST)
Received: from localhost ([::1]:46842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iEqOs-000087-6R
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 03:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45898)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1iEqMg-000812-TN
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 03:45:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1iEqMe-00033U-CT
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 03:45:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:26376)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1iEqMe-00033B-7C
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 03:45:00 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4317CC0546F1
 for <qemu-devel@nongnu.org>; Mon, 30 Sep 2019 07:44:58 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id k9so5574802wmb.0
 for <qemu-devel@nongnu.org>; Mon, 30 Sep 2019 00:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:user-agent:from:to:cc:date:message-id
 :mime-version;
 bh=LPpXlzgJ04dse/tWMYM+ARiixE85Un9mDw0o7S7fGb4=;
 b=jrciu7QG/h0gz7i3Fzb36j7LLiEU/vTA8r3uneTfvMYA/xazPzr3S/aGSQIzKk0ZNl
 iGPR5vVFzt7Vmrs2dWU21Bc9SE0HV4zbRx0cCAKTJS1EOpAcwH6Z3Dfy+MLdM1gBayfw
 pZfZaEKSEAswRlos/M+7+BJ0a93p1xUgu/i/XmucscFuoYP/W/7DNKY4Qk6WC+QaDD0x
 eL2yd03R+4M0tSfvr/9rNAI36NJHPyEMDwYIj34g5L34YkWqaABt8iPO3/bCzklcn/UI
 BNkj+6zYGbUCVfux9CYZ/+IAY6AOro+lXwoG1jLYCCL5F7tXiPQEdJX2N/NXnMqteOyb
 HJew==
X-Gm-Message-State: APjAAAXcXXFIoibe9BygYuH52f/49eXzgGdezRPYy5cel+cumFoIMkgl
 tZoEtI6y/eZQV6aqlH1Jrc2OKI6/Wias32ysRw0mOi6F7Cwe+RqMEdu8yMnMMgZYHV3GyJK923u
 lxJIXD6wTEeWK7D8=
X-Received: by 2002:a1c:b745:: with SMTP id h66mr15352299wmf.70.1569829497074; 
 Mon, 30 Sep 2019 00:44:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwoVvlmEgRGBxzE6fka/UmiVMHkecUsUXswXs2sSAn8+/1ao6hr2dxVkXmum8rtQQ9MP7C8UQ==
X-Received: by 2002:a1c:b745:: with SMTP id h66mr15352282wmf.70.1569829496898; 
 Mon, 30 Sep 2019 00:44:56 -0700 (PDT)
Received: from dritchie.redhat.com (139.red-95-120-215.dynamicip.rima-tde.net.
 [95.120.215.139])
 by smtp.gmail.com with ESMTPSA id h125sm26403755wmf.31.2019.09.30.00.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 00:44:56 -0700 (PDT)
User-agent: mu4e 1.2.0; emacs 26.2
From: Sergio Lopez <slp@redhat.com>
To: mihajlov@linux.vnet.ibm.com
Date: Mon, 30 Sep 2019 09:44:47 +0200
Message-ID: <87d0fii5xs.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: imammedo@redhat.com, tao3.xu@intel.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--=-=-=
Content-Type: text/plain

Hi,

Commit 137b5cb6ab565cb3781d5337591e155932b4230e (hmp: change
hmp_info_cpus to use query-cpus-fast) updated the "info cpus" commit to
make it more lightweight, but also removed the ability to get the
architecture specific status of each vCPU.

This information was really useful to diagnose certain Guest issues,
without the need of using GDB, which is more intrusive and requires
enabling it in advance.

Is there an alternative way of getting something equivalent to what
"info cpus" provided previously (in 2.10)?

Thanks,
Sergio.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl2Rsm8ACgkQ9GknjS8M
AjW2jg/+PZ2GxGuNPtHk0T7yvXWc+d4TT1FJ5HyEKxgXlYaNTGPJWnJrna+UKyfE
358iDEl6dC/C7Faia9JNy2ex6JtEtDe+Fc7e1e8DSWtppuutZ2UpME1EZEBlSlth
AQADDxswA/I1AlumV21+5H7TXRQTtZMmk8CCRDjdpt5EanTHddhx2RCcakO76MFV
1N5YH/whf7DRTuEwV77+zJQmuplqwhOXXq60K3Ac0u6rTGp9t03GxjrWyFpR3AJ0
LY9iyd+cRhsL3GiW+fci87MLhlpFRHBU/fzHeZsd44y+Bll309bezrOIi/EYAtZJ
6m76j2gxlDZsQe8SbrbiuTxd2jAyxYyR+P3eKL7Js/F3dgyjaGUnACXf1vbUVYaf
kpx4lZQOdarqDUy2sdWRS220TzJcv06IKdaIQkv7W7GCdRZmJ7TwhVXJGjA2KlkG
W2b5BQbxgzbOv6EobqJYGVSCwZ2+7DN1hXI+Jp/VJFbsp6SKY+Vb9caGUcYpI/wR
HfYw/YQ9iSY14On3GxxqfgS9RHMiXctJbJ3tmySTG009I/6yKWhi6SS5SuJ+I8Ps
zVsolUYt0CsWBvKkdWFne0b5gN+ejEK9RX4iZGa1cOHHgtr2fXfEUtS4SdfQq43l
RKTc8jwM10tWzj51AdhYMm7vSC+EwmPz1n6j6bzqrm7p+V0agYQ=
=fuIU
-----END PGP SIGNATURE-----
--=-=-=--

