Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7832D274A8B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 23:04:15 +0200 (CEST)
Received: from localhost ([::1]:60354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKpSQ-0001jm-2G
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 17:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robmeinzer11@gmx.de>)
 id 1kKp5w-0004hC-MZ
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 16:41:00 -0400
Received: from mout.gmx.net ([212.227.17.20]:52319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robmeinzer11@gmx.de>)
 id 1kKp5u-0002Nl-BC
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 16:41:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1600807252;
 bh=Jhy3uZ3dtIdPN8/sUXwozc9bHVl1qwpwuRthQ4vMc/0=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=XR2SgajWyjGlLxend07OcOqzIqhFNaPpPcLejUXQKXf8F+5cMBqrSERvVYsIx51Ty
 CDoWxWCnFrdtvqnQiDNpGjschhexzTvQ3hBo/meyiXM0uF1XniIP9p1wDZsi7n+eak
 V7TR6A2ywRCp+gd8PbysCTwt1kJZIlO19r/tJ6f8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [89.247.255.174] ([89.247.255.174]) by web-mail.gmx.net
 (3c-app-gmx-bap70.server.lan [172.19.172.170]) (via HTTP); Tue, 22 Sep 2020
 22:40:52 +0200
MIME-Version: 1.0
Message-ID: <trinity-896b2687-1386-4cd4-9ff6-71ac297c19d2-1600807252157@3c-app-gmx-bap70>
From: Robin Meinzer <robmeinzer11@gmx.de>
To: sgarzare@redhat.com, stefanha@redhat.com, qemu-devel@nongnu.org
Subject: Re: Re: questions regarding vsock
Content-Type: text/html; charset=UTF-8
Date: Tue, 22 Sep 2020 22:40:52 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20200917112050.GF809514@stefanha-x1.localdomain>
References: <trinity-1a5274e6-418e-46d1-bc32-f6f4380b8906-1600295102243@3c-app-gmx-bap30>
 <20200917112050.GF809514@stefanha-x1.localdomain>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:4ABoor+kol2bwzE4dFnIy8xNHj3H4pxbOF7d0eiRK+NcT9BdTbJYg/RCUG7t9azIamGG+
 DntZTdcQ9MFfLyP/K+ea1cgKzm5YjzPFd7fTvIOdmtDxMQ1Udgsdp1pZeGh0aRrJGt9C8ngyJi7x
 O10GRmrprJIyDtIOP9BFyQ6oh4ZzXsfvLfdO3vNcSaZ/HHILXyh+3/J6+Gn4B5x2foHgVmNqs5Mc
 U5BVzz1W4oK+q7V6nWdwAtwe+iXxonjNXlDQWtdcW/YUYz0e53wPQiRU7vH9qJZ7vTHIZ0qRpKgW
 H8=
X-UI-Out-Filterresults: notjunk:1;V03:K0:qlfJGM0NiIc=:dOk3yNekBM27K0rDjt5H0y
 qpUCNoGwe80osduQzDkrW1OzLlhPzKlKu9SyMM+Gq8HP0sYs2Jpoa2wEMhJGDYhBoEXc6k2NZ
 Z7wa2s7sSeVn+JNvs+XYx/sWWhd8IcSdyCA4HTR/Bg23O4ZQg+Wb6nDsAgX6J0J2mYtyhMoj/
 kqPhZDvxrPS4BtE/43pk3/6UagCwQHXYgz/ZYi5m419rkl2L2gpEZdKYzotVfSrHqqC2MgEQE
 GSJI189sswmwPkVfGKUtQJqaM84fniHsh5028TPYh3A0U45nysW/5D9wLHTKgNEx4pvaYg7GM
 lp9LV5H1/SaG+pyHzvVdly3SPCf4mEuwKGwnetZ4wgGfroVL8gj5zI7Xvuw2x63nKMkV6dIPB
 TdbxnLJa2BKG8hzklgOutnd4kTaNMNz/j7UV5w07ilPHw4laoXzvxRHwyt401AGppl0rge09e
 z5lP2YIQkEXPvrUymaQJnHsLDg3e/+7SLgHRgwChCcBCZXuwxD5IZVQpxiSDAaWsdat4XLX2R
 ErQJK039udn0SdBRZjat16LYsoANhIR2ejpOiN90bhj08iIpqr5XwMFbQpKbHq7DWROcPPA5s
 jBAYOIRPmgR5jNOSvBkiFSCd7H4fr9dM5YJVw6sOWtlgHxVXWOjyVPAIeCTHuYDnAwYZ25s1J
 0fO2ymAQIoCux/HkNhegtpkZdQ20EkyFsL3CtFW/wRMaHa5tMLndqWsADigKcNTTlb4A=
Received-SPF: pass client-ip=212.227.17.20; envelope-from=robmeinzer11@gmx.de;
 helo=mout.gmx.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 16:40:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, MIME_HTML_ONLY=0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 22 Sep 2020 16:57:09 -0400
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

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>&nbsp;
<div>
<div name="quote" style="margin:10px 5px 5px 10px; padding: 10px 0 10px 10px; border-left:2px solid #C3D9E5; word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;">
<div style="margin:0 0 10px 0;"><b>Gesendet:</b>&nbsp;Donnerstag, 17. September 2020 um 13:20 Uhr<br/>
<b>Von:</b>&nbsp;&quot;Stefan Hajnoczi&quot; &lt;stefanha@redhat.com&gt;<br/>
<b>An:</b>&nbsp;&quot;Robin Meinzer&quot; &lt;robmeinzer11@gmx.de&gt;<br/>
<b>Cc:</b>&nbsp;sgarzare@redhat.com<br/>
<b>Betreff:</b>&nbsp;Re: questions regarding vsock</div>

<div name="quoted-content">On Thu, Sep 17, 2020 at 12:25:02AM +0200, Robin Meinzer wrote:<br/>
<br/>
Hi,<br/>
I have CCed Stefano Garzarella, who co-maintains virtio-vsock with me.<br/>
Please send technical questions to qemu-devel@nongnu.org in the future<br/>
and CC us. That way others can participate in the discussion and it&#39;s<br/>
archived in case someone else has the same question in the future.<br/>
<br/>
&gt; &lt;div&gt;- If I want to run multiple qemu instances with vsock in each of them, -device ... guest-cid=CID has to be different for every VM. I don&amp;#39;t want to run VMs always manually, so can I assign a random or basically a free-to-take CID?&lt;br/&gt;<br/>
&gt; This is what I would expect: -device ... guest-cid=ANY_CID&lt;br/&gt;<br/>
<br/>
Userspace needs to allocate CIDs. The kernel does not automatically<br/>
allocate them. With Ethernet you would need to assign each guest a<br/>
unique MAC address, for example.<br/>
<br/>
Is there some unique value associated with your guests that you can use?<br/>
<br/>
&gt; - I managed to send data from host to vm and vice versa via SOCK_STREAM. Although whenever I want to use SOCK_DGRAM, I get an error message with &amp;quot;no such device&amp;quot;. Do you maybe know how to fix this to get a UDP-like connection?&lt;br/&gt;<br/>
<br/>
virtio-vsock currently only supports SOCK_STREAM.<br/>
<br/>
&gt; - I see that from factory vsock is only read-write to root and noone else, so I have to run the VM as root. How does it look in practice, is it just for me or does any distro ship with /dev/vsock set to root only, because it feels like I shouldn&amp;#39;t necessarily run a VM with root privileges.<br/>
<br/>
A privileged process can open /dev/vhost-vsock and spawn an unprivileged<br/>
QEMU process with -device vhost-vsock-pci,guest-cid=CID,vhostfd=FD.<br/>
<br/>
Stefan<br/>
<br/>
<br/>
--<br/>
I added Stefano Garzarella and qemu-devel as you asked. I wonder if you don&#39;t support SOCK_DGRAM but only SOCK_STREAM, why having code for it then? There are functions like vsock_dgram_connect and a proto_ops struct specifically for SOCK_DGRAM, but any attempt to create a socket for it ends with -ENODEV (transport_dgram is NULL, I guess it&#39;s on purpose because you don&#39;t support it as you said).<br/>
<br/>
Another thing, could you please tell me what I have to set in the kernel .config to have vsockets working out of the box, for now lsmod doesn&#39;t show me vmw_vsock_transport_common or vsock or vsock_host existence in the form of a autoloaded module at all.<br/>
<br/>
Greetings</div>
</div>
</div>
</div></div></body></html>

