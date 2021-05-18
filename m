Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223C1387A31
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 15:41:24 +0200 (CEST)
Received: from localhost ([::1]:56216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lizyN-0004YQ-6F
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 09:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas.parrott@canonical.com>)
 id 1liyqp-0006vx-Rq
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:29:31 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.90_1) (envelope-from <thomas.parrott@canonical.com>)
 id 1liyql-00060u-Np
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:29:31 -0400
Received: from mail-lf1-f70.google.com ([209.85.167.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <thomas.parrott@canonical.com>) id 1liyqi-0002DF-5z
 for qemu-devel@nongnu.org; Tue, 18 May 2021 12:29:24 +0000
Received: by mail-lf1-f70.google.com with SMTP id
 d26-20020a194f1a0000b02902390d1deb9dso1143208lfb.18
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 05:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=UZI/hIIzT4lPzoc4ONlbY6fM7K8stnXcaLEFETyzzpo=;
 b=DEJae6mf8qBpHN/Sk3JitqxVkKRmxkhiQHoDvLVS6sNoB6IUnqfhwiUUga4zzCbC0A
 C5GheijR+aG+kxMFhJQN/OH2LKOssUx4AQs5tK+yjM7oNXEtP6CADGV5GyiElUvEbhaH
 4Vy2raD4YGjIHysJPB+XN5abcxT5CO1QFMZ6APJxYadi1+qXh1PiUdux7kBbufcWLs0E
 WP2SSlScCR5sclpUszRKGcR+99Ndsa1kP6TATBCK2YuF/VZ+pApIOGQJRxcyjZukiUIL
 NQhN8YkaQWE14819S7h+Y20TTOcK7hs7OmaATjkYfTG8ZFdqGyujMqz3RgxgTLV3GGSo
 5lXQ==
X-Gm-Message-State: AOAM533GVQVlFkVPZpFogcA013GjIkrtiNOG0lxyihVBLjNl3s/R8AnG
 YT8ZeOftHMBMG2cNqUlH+TFsjLZrGwB/iHldwiShRK5zoPjPoHm3zYTNZdq8gFa/iEbVb/L0cAN
 KODkw6ypQ6BaWa8CXd9N+1xk8EyFk7+HcbOxkiA4kK1W27Q4R
X-Received: by 2002:a05:6512:22d6:: with SMTP id
 g22mr3974099lfu.406.1621340963691; 
 Tue, 18 May 2021 05:29:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoi3dlM6Qg4N5AFvQvge/TRBQ6VWu7oxRNoghGgraCB1XyZ6RNCEPOzgAecu/yCFeTZTcXlP9VUW5dhqzHOM4=
X-Received: by 2002:a05:6512:22d6:: with SMTP id
 g22mr3974076lfu.406.1621340963152; 
 Tue, 18 May 2021 05:29:23 -0700 (PDT)
MIME-Version: 1.0
From: Thomas Parrott <thomas.parrott@canonical.com>
Date: Tue, 18 May 2021 13:28:57 +0100
Message-ID: <CADNu6esr-fzfP8pug+Rfv+yJrEjDJaGy3EO+O-oLb_nMm7qLDg@mail.gmail.com>
Subject: Adding pcie-root-port devices via QMP apparently isn't possible
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000002b498705c299dc33"
Received-SPF: none client-ip=91.189.89.112;
 envelope-from=thomas.parrott@canonical.com; helo=youngberry.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 18 May 2021 09:39:06 -0400
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
Cc: marcel@redhat.com, jusual@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002b498705c299dc33
Content-Type: text/plain; charset="UTF-8"

Due to QEMU moving towards a QMP configuration mechanism and away from
config file support, the LXD team are currently in the process of migrating
to using QMP to add devices to VMs (so that we can support the use of QEMU
6.0).

Currently we are using the `-S` flag to freeze CPU at startup, then using
QMP to add NIC devices via the `device_add` command, and then using the
`cont` command to start the VM guest.

However we have found that it is apparently not possible to add a
pcie-root-port device via QMP.

Initially we tried using something like:

device_add
{"id":"qemu_pcie5","driver":"pcie-root-port","bus":"pcie.0","addr":"1.5","chassis":5,"multifunction":"on"}

Which was a straight conversion from the current config file we use.

However this gave the error:

Error: Bus 'pcie.0' does not support hotplugging

Then I found the `--preconfig` flag which sounded interesting, so we
removed the use of `-daemonize` which prevents the use of --preconfig` and
then tried adding the pcie-root-port devices in the preconfig stage.

But this resulted in the error:

The command 'device_add' isn't permitted in 'preconfig' state

So we wondered is this a bug, or if not, what is the correct way to be
adding pcie-root-ports going forward?

Thanks
Tom Parrott

--0000000000002b498705c299dc33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Due to QEMU moving towards a QMP configuration mechan=
ism and away=20
from config file support, the LXD team are currently in the process of=20
migrating to using QMP to add devices to VMs (so that we can support the
 use of QEMU 6.0).</div><div><br></div><div>Currently we are using the=20
`-S` flag to freeze CPU at startup, then using QMP to add NIC devices=20
via the `device_add` command, and then using the `cont` command to start
 the VM guest.<br></div><div><br></div><div>However we have found that it i=
s apparently not possible to add a pcie-root-port device via QMP.</div><div=
><br></div><div>Initially we tried using something like:</div><div><br></di=
v><div>device_add {&quot;id&quot;:&quot;qemu_pcie5&quot;,&quot;driver&quot;=
:&quot;pcie-root-port&quot;,&quot;bus&quot;:&quot;pcie.0&quot;,&quot;addr&q=
uot;:&quot;1.5&quot;,&quot;chassis&quot;:5,&quot;multifunction&quot;:&quot;=
on&quot;}</div><div><br></div><div>Which was a straight conversion from the=
 current config file we use.</div><div><br></div><div>However this gave the=
 error:</div><div><br></div><div>Error: Bus &#39;pcie.0&#39; does not suppo=
rt hotplugging</div><div><br></div><div>Then I found the `--preconfig` flag=
 which sounded interesting, so we removed the use of `-daemonize` which pre=
vents the use of --preconfig` and then tried adding the pcie-root-port devi=
ces in the preconfig stage.</div><div><br></div><div>But this resulted in t=
he error:</div><div><br></div><div>The command &#39;device_add&#39; isn&#39=
;t permitted in &#39;preconfig&#39; state</div><div><br></div><div>So we wo=
ndered is this a bug, or if not, what is the correct way to be adding pcie-=
root-ports going forward?</div><div><br></div><div>Thanks</div><div>Tom Par=
rott<br></div><div><br></div><div><br></div></div>

--0000000000002b498705c299dc33--

