Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5B3250AA5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 23:19:08 +0200 (CEST)
Received: from localhost ([::1]:48796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAJrv-00045o-Jx
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 17:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kpiq@gmx.us>) id 1kAJqN-0003SW-BE
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 17:17:33 -0400
Received: from mout.gmx.net ([212.227.17.20]:50621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kpiq@gmx.us>) id 1kAJqI-0003qw-By
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 17:17:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1598303841;
 bh=qxaqM9IX77C9ZCEnucyxv91rwlf5uWodzP650rvxhJk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=fxYziVrQXe4oY4brxNDCXlzJ4zj/QdGSwFay5czGQm9sNC/QXzDaKFIVEUyJim4+z
 NYHQnjLZOa54eMn2/I8EVaqyjQwJXTzgIH48oqm9oWkHSv2iwQiJeBRvpVDe4rj3uc
 2fcIsEGU/YfLTvok6Sugy1/BbAM0LVxgsQqkKfDw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [24.171.217.155] ([24.171.217.155]) by web-mail.gmx.net
 (3c-app-mailcom-bs16.server.lan [172.19.170.184]) (via HTTP); Mon, 24 Aug
 2020 23:17:21 +0200
MIME-Version: 1.0
Message-ID: <trinity-087afbfd-d8e2-4c15-9f55-f838a5f7e0e5-1598303841725@3c-app-mailcom-bs16>
From: Pedro Serrano <kpiq@gmx.us>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: unknown fs driver type 'virtiofs'
Content-Type: text/html; charset=UTF-8
Date: Mon, 24 Aug 2020 23:17:21 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20200824174521.GA2688@work-vm>
References: <trinity-3bf6c693-675f-4587-a673-717b058ceb06-1598236839217@3c-app-mailcom-bs08>
 <20200824174521.GA2688@work-vm>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:rIorv3QRqgCSoWIypYhnNzNvqVD8GPzB+SnmgTxIU74rj1Rdq5t7lncWuyHAKj7BwR8o2
 lZ7o4TFGP02HR78I9Ev78Cup9WRHh+AFFMch7j4W5xDJHUnGrhW/E5hGmg8hB/zA4XPdPJXZm4K/
 bjKzX8sDXULdZdrhsDAnhniGp7ZlQJGXQGdbEkcTiQJg9Yba5+M8cwt8NiW0M9MhhiIxMlHfjhxW
 xeWeg2YfVQzPqsBlwZRQttFtZR89L+ZCU1uFTohB12+55s3hhf3S9MRfHssHpB+O9t6IKnX0rYxX
 XI=
X-UI-Out-Filterresults: notjunk:1;V03:K0:LLP1dIlcZrw=:A4GN7ja0qR9ZSNDM7AgUcK
 vdSHl3QJrDD9k2qxx7HXnmHJE9zIsnyN412dK5RXqrOyUuOW9mLzfA5s4aF1GSYa/j5/S5rkP
 O/pseVpWQH7/82/kuOdA4GtCPByA2B30a4gfaLSVyhLeKxBWHfpS/AcA72U9u4NWbYBVrB9yk
 4sChq6J1nOJXhkA27Ln+KRpUiySX2Q35DWACJe397S4bB0ZSTwhlVK8OueekEICCwwnt6z6cH
 MkZGskhiUBBRA1TDwQ9f5d4prff0JsDj26wHXmY+34mIj05m28Hbzi7Ebttc1Q52dRcL5h7KE
 WlvS2+ehx5GnSpQ3aRxPu4vL3l6uxeDu0NxdyqcjWYaHbCEdT/aLPL+e+a2emiXpCiLQq8Sfz
 lJCKRaJbA4CkoI1xWCXRjShiScMwf+xZ+WXOOuPSPCowlsY98rb7NJxTWC4qhqbj8kY4UeTjV
 2/9kVAVbwGfpS9gZYRTQN53yM8Gwmw7c6g+n/24CbGigIWPKOa+AN5XhlBLsU9zuFpvss+Cna
 mTpW08CQhLDxWmHtNIkrRur9hwlaHgoTJtalSlxWliiF/GHTkVlXZQZsG/XLAuRAiiDOyadfh
 vQ1yj30KQC7E24EqAzfhmmwQbO1QSRyQquwkPJY4WzYYd0qeh0yvoG1PhbLdzmHSkZfJxrILK
 u0LuJ2ctxHGUcRqJc/yMAK84w2KIpP1rIX+pZ9rUNLRqzqw==
Received-SPF: pass client-ip=212.227.17.20; envelope-from=kpiq@gmx.us;
 helo=mout.gmx.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 17:17:24
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, MIME_HTML_ONLY=0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: stefanha@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>Dave</div>

<div>&nbsp;</div>

<div>Thanks for your attention.&nbsp; &nbsp;I have gone as far forward upgrading qemu and libvirt packages without going beyond stable+backports.&nbsp; &nbsp;I believe it is now a waiting game for Debian Buster backports to catch up with the release of newer versions that work with QEMU 5.0.0.</div>

<div>&nbsp;</div>

<div>If you have any more suggestions they will be appreciated.&nbsp; &nbsp;And sorry for the HTML on the email.&nbsp; &nbsp;I&#39;m not using an email client, just my email provider&#39;s website.&nbsp; I&#39;ll install Thunderbird or Evolution to avoid this in the future.</div>

<div>&nbsp;</div>

<div>Best regards</div>

<div>&nbsp;</div>

<div>Pedro</div>

<div>&nbsp;
<div>&nbsp;
<div style="margin: 10.0px 5.0px 5.0px 10.0px;padding: 10.0px 0 10.0px 10.0px;border-left: 2.0px solid rgb(195,217,229);">
<div style="margin: 0 0 10.0px 0;"><b>Sent:</b>&nbsp;Monday, August 24, 2020 at 1:45 PM<br/>
<b>From:</b>&nbsp;&quot;Dr. David Alan Gilbert&quot; &lt;dgilbert@redhat.com&gt;<br/>
<b>To:</b>&nbsp;&quot;Pedro Serrano&quot; &lt;kpiq@gmx.us&gt;<br/>
<b>Cc:</b>&nbsp;qemu-devel@nongnu.org, stefanha@gmail.com<br/>
<b>Subject:</b>&nbsp;Re: unknown fs driver type &#39;virtiofs&#39;</div>

<div>* Pedro Serrano (kpiq@gmx.us) wrote:<br/>
&gt; &lt;html&gt;&lt;head&gt;&lt;/head&gt;&lt;body&gt;&lt;div style=&quot;font-family: Verdana;font-size: 12.0px;&quot;&gt;&lt;pre&gt;Folks<br/>
&gt;<br/>
&gt; The instructions posted on &lt;a href=&quot;http://blog.vmsplice.net/2020/04/virtio-fs-has-landed-in-qemu-50.html&quot; target=&quot;_blank&quot;&gt;<a href="http://blog.vmsplice.net/2020/04/virtio-fs-has-landed-in-qemu-50.html" target="_blank">http://blog.vmsplice.net/2020/04/virtio-fs-has-landed-in-qemu-50.html</a>&lt;/a&gt; are simple and I followed them.<br/>
&gt;<br/>
&gt; I&amp;#39;ve updated my Debian Buster QEMU and LIBVIRT packages to all the newest buster-backports versions, and am running on:<br/>
&gt;<br/>
&gt; Linux ps01ubx 5.7.0-0.bpo.2-amd64 #1 SMP Debian 5.7.10-1~bpo10+1 (2020-07-30) x86_64 GNU/Linux<br/>
&gt;<br/>
&gt; lsmod&amp;#124;grep virtio<br/>
&gt; virtiofs 32768 0<br/>
&gt; virtio_ring 36864 1 virtiofs<br/>
&gt; virtio 16384 1 virtiofs<br/>
&gt; fuse 139264 4 virtiofs<br/>
&gt;<br/>
&gt; dpkg -l gir1.2-libvirt-glib-1.0:amd64 ipxe-qemu libvirglrenderer0:amd64 libvirt-clients libvirt-daemon libvirt-daemon-system libvirt-glib-1.0-0:amd64 libvirt0:amd64 python3-libvirt qemu qemu-block-extra qemu-system-common qemu-system-data qemu-system-gui:amd64 qemu-system-x86 qemu-utils<br/>
&gt; Desired=Unknown/Install/Remove/Purge/Hold<br/>
&gt; &amp;#124; Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend<br/>
&gt; &amp;#124;/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)<br/>
&gt; &amp;#124;&amp;#124;/ Name Version Architecture Desc<br/>
&gt; +++-=============================-============================-============-====<br/>
&gt; ii gir1.2-libvirt-glib-1.0:amd64 1.0.0-1 amd64 GObj<br/>
&gt; ii ipxe-qemu 1.0.0+git-20190125.36a4c85-1 all PXE<br/>
&gt; ii libvirglrenderer0:amd64 0.7.0-2 amd64 virt<br/>
&gt; ii libvirt-clients 5.0.0-4+deb10u1 amd64 Prog<br/>
&gt; ii libvirt-daemon 5.0.0-4+deb10u1 amd64 Virt<br/>
&gt; ii libvirt-daemon-system 5.0.0-4+deb10u1 amd64 Libv<br/>
&gt; ii libvirt-glib-1.0-0:amd64 1.0.0-1 amd64 libv<br/>
&gt; ii libvirt0:amd64 5.0.0-4+deb10u1 amd64 libr<br/>
&gt; ii python3-libvirt 5.0.0-1 amd64 libv<br/>
&gt; ii qemu 1:5.0-14~bpo10+1 amd64 fast<br/>
&gt; ii qemu-block-extra 1:5.0-14~bpo10+1 amd64 extr<br/>
&gt; ii qemu-system-common 1:5.0-14~bpo10+1 amd64 QEMU<br/>
&gt; ii qemu-system-data 1:5.0-14~bpo10+1 all QEMU<br/>
&gt; ii qemu-system-gui:amd64 1:5.0-14~bpo10+1 amd64 QEMU<br/>
&gt; ii qemu-system-x86 1:5.0-14~bpo10+1 amd64 QEMU<br/>
&gt; ii qemu-utils 1:5.0-14~bpo10+1 amd64 QEMU<br/>
&gt;<br/>
&gt; Whenever I add a filesystem to the vm xml (virsh edit vm) virt-manager spits out an error message. Because virt-manager doesn&amp;#39;t have a &amp;quot;virtiofs&amp;quot; line in the drop-down choices I first choose &amp;quot;PATH&amp;quot; and then try to change the XML.<br/>
&gt;<br/>
&gt; &amp;lt;filesystem type=&amp;#39;mount&amp;#39; accessmode=&amp;#39;passthrough&amp;#39;&amp;gt;<br/>
&gt; &amp;lt;driver type=&amp;#39;virtiofs&amp;#39;/&amp;gt;&lt;/pre&gt;<br/>
&gt;<br/>
&gt;<br/>
&gt;<br/>
&gt; The result is similar, whether I use virt-manager or virsh edit vm:<br/>
&gt;<br/>
<br/>
I think your libvirt is too old; my reckoning is it went in v6.1.0 (or<br/>
was it 6.2.0?)<br/>
<br/>
&gt; virtio-manager replies: unknown fs driver type &amp;#39;virtiofs&amp;#39;<br/>
&gt;<br/>
&gt; virsh edit vm does not let me save the file. It replies:<br/>
&gt; error: XML document failed to validate against schema: Unable to validate doc against /usr/share/libvirt/schemas/domain.rng&lt;br/&gt;<br/>
&gt; Extra element devices in interleave&lt;br/&gt;<br/>
&gt; Element domain failed to validate content<br/>
&gt;<br/>
&gt; Failed. Try again? [y,n,i,f,?]:<br/>
&gt;<br/>
&gt;<br/>
&gt; What am I doing wrong?<br/>
<br/>
You&#39;re also using HTML mail without plaintext!<br/>
<br/>
Dave<br/>
<br/>
&gt; Regards<br/>
&gt;<br/>
&gt; Pedro Serrano<br/>
&gt;<br/>
&gt;<br/>
--<br/>
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK<br/>
&nbsp;</div>
</div>
</div>
</div></div></body></html>

