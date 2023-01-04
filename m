Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370EE65CDA5
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 08:33:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCyGJ-0006P0-RR; Wed, 04 Jan 2023 02:32:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pCyFb-0006Hu-G1
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 02:31:57 -0500
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pCyFX-00009N-NZ
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 02:31:51 -0500
Received: by mail-qt1-x82d.google.com with SMTP id h21so26591652qta.12
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 23:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:references:user-agent
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=993gR90X3N8MSr/3WxHFe2/xx+HwzNvAmmRWn9i2gwo=;
 b=g/K2A9aoKm4l9sZOn/PmlgWL6131vN9DC0XMk1ciHW6xiRh4Sggh19cgcTmU3+PoLf
 D9ueYuJ2rSqKfRPUPfblsAsuJjreJohy9WpLvvmqeBN96V1ZBzdiRJRxjj6m5NfaSPZZ
 hZ2s4mGuEAPEQRBpBjdtDvOMzrdLreFIjaIiSXyyFmRTmSS255stLszYbjaRxKGcUg1c
 Z6Dyt+siuGh6Ys51qBjLbO4pdgKsU97AHgzhy73wKHmuzZPM/eEZmhFZQEAJZHgtDwnS
 ZYgqLPtw7NGo8VLWCOBRMERtzjcjiTVoujl36mlPoXWk166bwYlsU3S+CwQyvavZee42
 z6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:references:user-agent
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=993gR90X3N8MSr/3WxHFe2/xx+HwzNvAmmRWn9i2gwo=;
 b=Z22Cd6ga1xetn+hj8UBDOu7Ui0oXwnNVZfMJB3ehagICNcXr2vuVzBX6WzEBvZkMPr
 1jkrgIk6hB6Ek9slNtLfXBKM0tXvsYIz8K6a7k7Fp0mOj3GtrcAeXSW6+TE4rO1OhgJG
 5m6ASB368vZB2UllBfmHALWCo886dsOGl5mCIui34pTXTGJvxxQXR2vmxj4Ts0uVgUJZ
 S+1TUIzzNFMQsEOw1A8pTmAJo0pBycDYXd7//mFagsem1XA6eKiVt7tbTcdhMf0tH82g
 B7Q42FxCzj+ANXyS2uA49yn1aisM/1fpCqpcXxpQpVnMNsvygTZX+v0AnYifGY4dDYNR
 1+8g==
X-Gm-Message-State: AFqh2kqj9SeUNeIS8rKvv8s5/gp7jtjoSKv1oa59LO19XL+JjOre8TaW
 eYzCGWcaniUJfS/+dgM8Hsd1x2toS809wvvYy+cbyQ==
X-Google-Smtp-Source: AMrXdXsdQ5oxK10IJwLawh6B4bohZexDv4zAhKByJiR10WewH/lObJDyRY2/3p33UNlCE5tvamRFKpG7B5yrTGpYbQY=
X-Received: by 2002:ac8:4646:0:b0:3a8:1081:9ae1 with SMTP id
 f6-20020ac84646000000b003a810819ae1mr2197083qto.641.1672817500565; Tue, 03
 Jan 2023 23:31:40 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST; 
 Wed, 4 Jan 2023 01:31:39 -0600
Mime-Version: 1.0
In-Reply-To: <8d7fe410-4b44-040e-5e6b-b123207913bd@redhat.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
References: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
 <20221223142307.1614945-4-xuchuangxclwt@bytedance.com>
 <8d7fe410-4b44-040e-5e6b-b123207913bd@redhat.com>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
Date: Wed, 4 Jan 2023 01:31:39 -0600
Message-ID: <CALophusobmSY+nVdteJfkDvUN-nGF24cUBhB6Y24ginY5KLBgA@mail.gmail.com>
Subject: Re: [RFC v4 3/3] migration: reduce time of loading non-iterable
 vmstate
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com, 
 pbonzini@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 zhouyibo@bytedance.com
Content-Type: multipart/alternative; boundary="000000000000e556ca05f16b2cf8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FORGED_MUA_MOZILLA=2.309, FROM_LOCAL_NOVOWEL=0.5,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-3.103, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000e556ca05f16b2cf8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2022/12/24 =E4=B8=8A=E5=8D=8812:06, David Hildenbrand wrote:

On 23.12.22 15:23, Chuang Xu wrote:

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
before        about 150 ms              740+ ms
after        about 30 ms              630+ ms

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
before        about 90 ms             about 250 ms

after        about 25 ms             about 160 ms

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
before        about 20 ms             about 70 ms
after        about 11 ms             about 60 ms

As we can see from the test results above, both the number of queues and
the number of devices have a great impact on the time of loading
non-iterable
vmstate. The growth of the number of devices and queues will lead to more
mr commits, and the time consumption caused by the flatview reconstruction
will also increase.

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
<xuchuangxclwt@bytedance.com>
---
  migration/savevm.c | 7 +++++++
  1 file changed, 7 insertions(+)

diff --git a/migration/savevm.c b/migration/savevm.c
index a0cdb714f7..19785e5a54 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2617,6 +2617,9 @@ int qemu_loadvm_state_main(QEMUFile *f,
MigrationIncomingState *mis)
      uint8_t section_type;
      int ret =3D 0;
  +    /* call memory_region_transaction_begin() before loading vmstate */



I'd suggest extending the comment *why* you are doing that, that it's a
pure performance optimization, and how it achieves that.

Thanks! I'll extend the comment in v5.

--000000000000e556ca05f16b2cf8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix"><div id=3D"lark-mail-quote-c06f296f8a0e9=
55ae5e1731cacc9647b">On 2022/12/24 =E4=B8=8A=E5=8D=8812:06, David
      Hildenbrand wrote:<br>
    </div></div>
    <blockquote type=3D"cite" cite=3D"mid:8d7fe410-4b44-040e-5e6b-b12320791=
3bd@redhat.com">On
      23.12.22 15:23, Chuang Xu wrote:
      <br>
      <blockquote type=3D"cite">The duration of loading non-iterable
        vmstate accounts for a significant
        <br>
        portion of downtime (starting with the timestamp of source qemu
        stop and
        <br>
        ending with the timestamp of target qemu start). Most of the
        time is spent
        <br>
        committing memory region changes repeatedly.
        <br>
        <br>
        This patch packs all the changes to memory region during the
        period of
        <br>
        loading non-iterable vmstate in a single memory transaction.
        With the
        <br>
        increase of devices, this patch will greatly improve the
        performance.
        <br>
        <br>
        Here are the test1 results:
        <br>
        test info:
        <br>
        - Host
        <br>
        =C2=A0=C2=A0 - Intel(R) Xeon(R) Platinum 8260 CPU
        <br>
        =C2=A0=C2=A0 - NVIDIA Mellanox ConnectX-5
        <br>
        - VM
        <br>
        =C2=A0=C2=A0 - 32 CPUs 128GB RAM VM
        <br>
        =C2=A0=C2=A0 - 8 16-queue vhost-net device
        <br>
        =C2=A0=C2=A0 - 16 4-queue vhost-user-blk device.
        <br>
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0time of loading non-iterable vmstate=C2=A0=
=C2=A0=C2=A0=C2=A0 downtime
        <br>
        before=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 about 150 ms=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 74=
0+ ms
        <br>
        after=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 about 30 ms=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 63=
0+ ms
        <br>
        <br>
        In test2, we keep the number of the device the same as test1,
        reduce the
        <br>
        number of queues per device:
        <br>
        <br>
        Here are the test2 results:
        <br>
        test info:
        <br>
        - Host
        <br>
        =C2=A0=C2=A0 - Intel(R) Xeon(R) Platinum 8260 CPU
        <br>
        =C2=A0=C2=A0 - NVIDIA Mellanox ConnectX-5
        <br>
        - VM
        <br>
        =C2=A0=C2=A0 - 32 CPUs 128GB RAM VM
        <br>
        =C2=A0=C2=A0 - 8 1-queue vhost-net device
        <br>
        =C2=A0=C2=A0 - 16 1-queue vhost-user-blk device.
        <br>
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0time of loading non-iterable vmstate=C2=A0=
=C2=A0=C2=A0=C2=A0 downtime
        <br>
        before=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 about 90 ms=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 about 25=
0 ms
        <br>
        <br>
        after=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 about 25 ms=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 about 16=
0 ms
        <br>
        <br>
        In test3, we keep the number of queues per device the same as
        test1, reduce
        <br>
        the number of devices:
        <br>
        <br>
        Here are the test3 results:
        <br>
        test info:
        <br>
        - Host
        <br>
        =C2=A0=C2=A0 - Intel(R) Xeon(R) Platinum 8260 CPU
        <br>
        =C2=A0=C2=A0 - NVIDIA Mellanox ConnectX-5
        <br>
        - VM
        <br>
        =C2=A0=C2=A0 - 32 CPUs 128GB RAM VM
        <br>
        =C2=A0=C2=A0 - 1 16-queue vhost-net device
        <br>
        =C2=A0=C2=A0 - 1 4-queue vhost-user-blk device.
        <br>
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0time of loading non-iterable vmstate=C2=A0=
=C2=A0=C2=A0=C2=A0 downtime
        <br>
        before=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 about 20 ms=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 about 70=
 ms
        <br>
        after=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 about 11 ms=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 about 60=
 ms
        <br>
        <br>
        As we can see from the test results above, both the number of
        queues and
        <br>
        the number of devices have a great impact on the time of loading
        non-iterable
        <br>
        vmstate. The growth of the number of devices and queues will
        lead to more
        <br>
        mr commits, and the time consumption caused by the flatview
        reconstruction
        <br>
        will also increase.
        <br>
        <br>
        Signed-off-by: Chuang Xu <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:xuchuangxclwt@bytedance.com">&lt;xuchuangxclwt@bytedance.com&gt;</a=
>
        <br>
        ---
        <br>
        =C2=A0 migration/savevm.c | 7 +++++++
        <br>
        =C2=A0 1 file changed, 7 insertions(+)
        <br>
        <br>
        diff --git a/migration/savevm.c b/migration/savevm.c
        <br>
        index a0cdb714f7..19785e5a54 100644
        <br>
        --- a/migration/savevm.c
        <br>
        +++ b/migration/savevm.c
        <br>
        @@ -2617,6 +2617,9 @@ int qemu_loadvm_state_main(QEMUFile *f,
        MigrationIncomingState *mis)
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t section_type;
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret =3D 0;
        <br>
        =C2=A0 +=C2=A0=C2=A0=C2=A0 /* call memory_region_transaction_begin(=
) before loading
        vmstate */
        <br>
      </blockquote>
      <br>
      <br>
      I&#39;d suggest extending the comment *why* you are doing that, that
      it&#39;s a pure performance optimization, and how it achieves that.
      <br>
      <br>
    </blockquote>
    <pre>Thanks! I&#39;ll extend the comment in v5.
</pre>
 =20
</body></html>

--000000000000e556ca05f16b2cf8--

