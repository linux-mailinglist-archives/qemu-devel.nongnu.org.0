Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 300D66553CB
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 20:13:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8nSY-0002y8-HO; Fri, 23 Dec 2022 14:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p8nSV-0002ov-Lj
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 14:11:55 -0500
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p8nSS-0003Rd-0U
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 14:11:55 -0500
Received: by mail-qk1-x736.google.com with SMTP id pa22so2753111qkn.9
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 11:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:from
 :references:user-agent:from:to:cc:subject:date:message-id:reply-to;
 bh=Ozd5V1M7uVP+7uEgR6P/CnZvsR3FsiNboT+wz8HNXV0=;
 b=ZQ96/R1/fKMzO5b0/chSmxhEH/Vs+Lv/NEkN3a5qV6oyesiqgruZQHq+lPkkBkloYO
 yHiWgt05X/Kmr422CjP/Jqwm0QLM9Td5t9JRuDmsuo5NpHu4Ztc7AE3ldNwnRZXIqWJ6
 p+iByieqqqiKufsCWpoEis4EhFjGorfne8YRtV5AOS04lJd3bxesCWZRmWuuu+jeFaJp
 b7BKRo2rKFGwjP2XSGV2x6er9b+O5Jd6ZEBt2RCSCYR2udIK/jGnp6W8F9pvEy9pzU+U
 D16XZ5RiwJmwA4juJ9x86bycGAwgaUmpZ0XWc6NIkqQcLXcW4hdaMfFCqUpf1PcAaFRb
 7aHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:from
 :references:user-agent:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ozd5V1M7uVP+7uEgR6P/CnZvsR3FsiNboT+wz8HNXV0=;
 b=YuuiKn96lgzJE09cMLu2NNu1zcqYghZ1H0JxpA2RScyu7Cs4hGdUaMgGwcKMva2yfO
 uVfJHUNOuhK5eqiBxVNiobylIUjdF5FlVVQwRahkRpDTuhT1WUCqgHUvCpCHHR6q+E+6
 Tanf5Q87GZb8rkbgqq7sZb4Ey6hOlXxKG+dMmL94edqoQhUfPbvWdBLt9JHjxkJFWDiI
 MzBDiV1YRgrYlrdo3DuVyDU5+gCuW0TxK07jP5XQ1UPEuzdLkzSyKNZWbv+yoDdXvdb/
 HbURcvXPqYi3a3cHsJmtKUrKBbXbgD88tiYoRcXviPyoiyUleMGTF9iFjhk6TXLx6z6q
 l9iA==
X-Gm-Message-State: AFqh2krjSdNHTVEjFWmVcA3otg3vUmOB98BV1gQOSB9RpqZrbr7Xe4wL
 Fr4QZWvrPxtMa/OkWbG2TWJu53O/ITvG89PE1kQ6Iw==
X-Google-Smtp-Source: AMrXdXtF/pYWldy6UtU6cYp9DV3pnd1G2VzLyQrm1nKFuZWZutRbF2SM/Zd+Ag3Gjmaj/QGuNN2eDtdwf1tHFC6Cjyw=
X-Received: by 2002:a05:620a:13ec:b0:6fe:d95e:6d5f with SMTP id
 h12-20020a05620a13ec00b006fed95e6d5fmr464748qkl.760.1671822708157; Fri, 23
 Dec 2022 11:11:48 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST; 
 Fri, 23 Dec 2022 11:11:47 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
References: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
 <Y6XOV+ib6a8p2Zjl@x1n>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
Mime-Version: 1.0
In-Reply-To: <Y6XOV+ib6a8p2Zjl@x1n>
Date: Fri, 23 Dec 2022 11:11:47 -0800
Message-ID: <CALophusSr9kxN15HZR7ousHrbvc2tTMXM04E5oqQJOVAC4NnQA@mail.gmail.com>
Subject: Re: [RFC v4 0/3] migration: reduce time of loading non-iterable
 vmstate
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com, 
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org, 
 zhouyibo@bytedance.com
Content-Type: multipart/alternative; boundary="000000000000a5de6a05f0838e47"
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: 18
X-Spam_score: 1.8
X-Spam_bar: +
X-Spam_report: (1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FORGED_MUA_MOZILLA=2.309, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999,
 HK_RANDOM_FROM=0.999, HTML_MESSAGE=0.001, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--000000000000a5de6a05f0838e47
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2022/12/23 =E4=B8=8B=E5=8D=8811:50, Peter Xu wrote:

Chuang,

On Fri, Dec 23, 2022 at 10:23:04PM +0800, Chuang Xu wrote:

In this version:

- attach more information in the cover letter.
- remove changes on virtio_load().
- add rcu_read_locked() to detect holding of rcu lock.

The duration of loading non-iterable vmstate accounts for a significant
portion of downtime (starting with the timestamp of source qemu stop and
ending with the timestamp of target qemu start). Most of the time is spent
committing memory region changes repeatedly.

This patch packs all the changes to memory region during the period of
loading non-iterable vmstate in a single memory transaction. With the
increase of devices, this patch will greatly improve the performance.

Here are the test1 results:
test info:
- Host
  - Intel(R) Xeon(R) Platinum 8260 CPU
  - NVIDIA Mellanox ConnectX-5
- VM
  - 32 CPUs 128GB RAM VM
  - 8 16-queue vhost-net device
  - 16 4-queue vhost-user-blk device.

	time of loading non-iterable vmstate     downtime
before	about 150 ms			  740+ ms
after		about 30 ms			  630+ ms

Have you investigated why multi-queue added so much downtime overhead with
the same environment, comparing to below [1]?

I have analyzed the downtime in detail. Both stopping and starting the
device are
time-consuming.

For stopping vhost-net devices, vhost_net_stop_one() will be called once mo=
re
for each additional queue, while vhost_virtqueue_stop() will be called twic=
e
in vhost_dev_stop(). For example, we need to call vhost_virtqueue_stop()
32(=3D 16 * 2) times to stop a 16-queue vhost-net device. In
vhost_virtqueue_stop(),
QEMU needs to negotiate with the vhost user daemon. The same is true
for vhost-net
devices startup.

For stopping vhost-user-blk devices, vhost_virtqueue_stop() will be called =
once
more for each additional queue. For example, we need to call
vhost_virtqueue_stop()
4 times to stop a 4-queue vhost-user-blk device. The same is true for
vhost-user-blk
devices startup.

It seems that the vhost-user-blk device is less affected by the number
of queues
than the vhost-net device. However, the vhost-user-blk device needs to prep=
are
inflight when it is started. The negotiation with spdk in this step is also
time-consuming. I tried to move this step to the startup phase of the
target QEMU
before the migration started. In my test, This optimization can greatly red=
uce
the vhost-user-blk device startup time and thus reduce the downtime.
I'm not sure
whether this is hacky. If you are interested in this, maybe we can
discuss it further.

(This result is different from that of v1. It may be that someone has
changed something on my host.., but it does not affect the display of
the optimization effect.)


In test2, we keep the number of the device the same as test1, reduce the
number of queues per device:

Here are the test2 results:
test info:
- Host
  - Intel(R) Xeon(R) Platinum 8260 CPU
  - NVIDIA Mellanox ConnectX-5
- VM
  - 32 CPUs 128GB RAM VM
  - 8 1-queue vhost-net device
  - 16 1-queue vhost-user-blk device.

	time of loading non-iterable vmstate     downtime
before	about 90 ms			 about 250 ms
after		about 25 ms			 about 160 ms

[1]


In test3, we keep the number of queues per device the same as test1, reduce
the number of devices:

Here are the test3 results:
test info:
- Host
  - Intel(R) Xeon(R) Platinum 8260 CPU
  - NVIDIA Mellanox ConnectX-5
- VM
  - 32 CPUs 128GB RAM VM
  - 1 16-queue vhost-net device
  - 1 4-queue vhost-user-blk device.

	time of loading non-iterable vmstate     downtime
before	about 20 ms			 about 70 ms
after		about 11 ms			 about 60 ms


As we can see from the test results above, both the number of queues and
the number of devices have a great impact on the time of loading non-iterab=
le
vmstate. The growth of the number of devices and queues will lead to more
mr commits, and the time consumption caused by the flatview reconstruction
will also increase.

The downtime measured in precopy can be more complicated than postcopy
because the time of switch is calculated by qemu based on the downtime
setup, and also that contains part of RAM migrations.  Postcopy should be
more accurate on that because there's no calculation done, meanwhile
there's no RAM transferred during downtime.

However postcopy downtime is not accurate either in implementation of it in
postcopy_start(), where the downtime is measured right after we flushed the
packed data, and right below it there's some idea of optimizing it:

    if (migrate_postcopy_ram()) {
        /*
         * Although this ping is just for debug, it could potentially be
         * used for getting a better measurement of downtime at the source.
         */
        qemu_savevm_send_ping(ms->to_dst_file, 4);
    }

So maybe I'll have a look there.

The current calculation of downtime is really inaccurate, because the sourc=
e
side calculation does not take into account the time consumption of various
factors at the destination side. Maybe we can consider transmitting some ke=
y
timestamps to the destination, and the destination will calculate the actua=
l
downtime data after startup.



Besides above, personally I'm happy with the series, one trivial comment in
patch 2 but not a huge deal.  I don't expect you can get any more comment
before the end of this year.. but let's wait until after the Xmas holiday.

Thanks!


I=E2=80=99ll further modify the patch 2 according to your comments.

Merry Christmas!

--000000000000a5de6a05f0838e47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix"><div id=3D"lark-mail-quote-6f5c145bb5d74=
f98a4743a3b70ad29a9">On 2022/12/23 =E4=B8=8B=E5=8D=8811:50, Peter Xu wrote:=
<br>
    </div></div>
    <blockquote type=3D"cite" cite=3D"mid:Y6XOV+ib6a8p2Zjl@x1n">
      <pre class=3D"moz-quote-pre">Chuang,

On Fri, Dec 23, 2022 at 10:23:04PM +0800, Chuang Xu wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre">In this version:

- attach more information in the cover letter.
- remove changes on virtio_load().
- add rcu_read_locked() to detect holding of rcu lock.

The duration of loading non-iterable vmstate accounts for a significant
portion of downtime (starting with the timestamp of source qemu stop and
ending with the timestamp of target qemu start). Most of the time is spent
committing memory region changes repeatedly.

This patch packs all the changes to memory region during the period of
loading non-iterable vmstate in a single memory transaction. With the
increase of devices, this patch will greatly improve the performance.

Here are the test1 results:
test info:
- Host
  - Intel(R) Xeon(R) Platinum 8260 CPU
  - NVIDIA Mellanox ConnectX-5
- VM
  - 32 CPUs 128GB RAM VM
  - 8 16-queue vhost-net device
  - 16 4-queue vhost-user-blk device.

	time of loading non-iterable vmstate     downtime
before	about 150 ms			  740+ ms
after		about 30 ms			  630+ ms
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre">Have you investigated why multi-queue ad=
ded so much downtime overhead with
the same environment, comparing to below [1]?
</pre>
    </blockquote>
    <pre>I have analyzed the downtime in detail. Both stopping and starting=
 the device are=20
time-consuming.=20

For stopping vhost-net devices, vhost_net_stop_one() will be called once mo=
re=20
for each additional queue, while vhost_virtqueue_stop() will be called twic=
e=20
in vhost_dev_stop(). For example, we need to call vhost_virtqueue_stop()=20
32(=3D 16 * 2) times to stop a 16-queue vhost-net device. In vhost_virtqueu=
e_stop(),=20
QEMU needs to negotiate with the vhost user daemon. The same is true for vh=
ost-net=20
devices startup.

For stopping vhost-user-blk devices, vhost_virtqueue_stop() will be called =
once=20
more for each additional queue. For example, we need to call vhost_virtqueu=
e_stop()=20
4 times to stop a 4-queue vhost-user-blk device. The same is true for vhost=
-user-blk=20
devices startup.=20

It seems that the vhost-user-blk device is less affected by the number of q=
ueues=20
than the vhost-net device. However, the vhost-user-blk device needs to prep=
are=20
inflight when it is started. The negotiation with spdk in this step is also=
=20
time-consuming. I tried to move this step to the startup phase of the targe=
t QEMU=20
before the migration started. In my test, This optimization can greatly red=
uce=20
the vhost-user-blk device startup time and thus reduce the downtime. I&#39;=
m not sure=20
whether this is hacky. If you are interested in this, maybe we can discuss =
it further.
</pre>
    <blockquote type=3D"cite" cite=3D"mid:Y6XOV+ib6a8p2Zjl@x1n">
      <pre class=3D"moz-quote-pre"></pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre">(This result is different from that of=
 v1. It may be that someone has=20
changed something on my host.., but it does not affect the display of=20
the optimization effect.)


In test2, we keep the number of the device the same as test1, reduce the=20
number of queues per device:

Here are the test2 results:
test info:
- Host
  - Intel(R) Xeon(R) Platinum 8260 CPU
  - NVIDIA Mellanox ConnectX-5
- VM
  - 32 CPUs 128GB RAM VM
  - 8 1-queue vhost-net device
  - 16 1-queue vhost-user-blk device.

	time of loading non-iterable vmstate     downtime
before	about 90 ms			 about 250 ms
after		about 25 ms			 about 160 ms
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre">[1]

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre">In test3, we keep the number of queues=
 per device the same as test1, reduce=20
the number of devices:

Here are the test3 results:
test info:
- Host
  - Intel(R) Xeon(R) Platinum 8260 CPU
  - NVIDIA Mellanox ConnectX-5
- VM
  - 32 CPUs 128GB RAM VM
  - 1 16-queue vhost-net device
  - 1 4-queue vhost-user-blk device.

	time of loading non-iterable vmstate     downtime
before	about 20 ms			 about 70 ms
after		about 11 ms			 about 60 ms


As we can see from the test results above, both the number of queues and=20
the number of devices have a great impact on the time of loading non-iterab=
le=20
vmstate. The growth of the number of devices and queues will lead to more=
=20
mr commits, and the time consumption caused by the flatview reconstruction=
=20
will also increase.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre">The downtime measured in precopy can be =
more complicated than postcopy
because the time of switch is calculated by qemu based on the downtime
setup, and also that contains part of RAM migrations.  Postcopy should be
more accurate on that because there&#39;s no calculation done, meanwhile
there&#39;s no RAM transferred during downtime.

However postcopy downtime is not accurate either in implementation of it in
postcopy_start(), where the downtime is measured right after we flushed the
packed data, and right below it there&#39;s some idea of optimizing it:

    if (migrate_postcopy_ram()) {
        /*
         * Although this ping is just for debug, it could potentially be
         * used for getting a better measurement of downtime at the source.
         */
        qemu_savevm_send_ping(ms-&gt;to_dst_file, 4);
    }

So maybe I&#39;ll have a look there.</pre>
    </blockquote>
    <pre>The current calculation of downtime is really inaccurate, because =
the source=20
side calculation does not take into account the time consumption of various=
=20
factors at the destination side. Maybe we can consider transmitting some ke=
y=20
timestamps to the destination, and the destination will calculate the actua=
l=20
downtime data after startup.</pre>
    <blockquote type=3D"cite" cite=3D"mid:Y6XOV+ib6a8p2Zjl@x1n">
      <pre class=3D"moz-quote-pre">

Besides above, personally I&#39;m happy with the series, one trivial commen=
t in
patch 2 but not a huge deal.  I don&#39;t expect you can get any more comme=
nt
before the end of this year.. but let&#39;s wait until after the Xmas holid=
ay.

Thanks!

</pre>
    </blockquote>
    <pre>I=E2=80=99ll further modify the patch 2 according to your comments=
.

Merry Christmas!
</pre>
 =20
</body></html>

--000000000000a5de6a05f0838e47--

