Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E9C5B36D2
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 13:58:18 +0200 (CEST)
Received: from localhost ([::1]:50550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWceH-0007DG-5W
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 07:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oWccP-0005Ul-4b; Fri, 09 Sep 2022 07:56:21 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oWccN-0007bN-DW; Fri, 09 Sep 2022 07:56:20 -0400
Received: by mail-ej1-x62c.google.com with SMTP id l14so3396872eja.7;
 Fri, 09 Sep 2022 04:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=0wiBO4Qgn2f/oAakm74MKrsEpWN33LSkfekcwpwrDqM=;
 b=l1DV4LNaM7TfOH03d96Hac2koM5RRNCRhYI/DJeKzfbn/0HCxPD3XDBL9KdVihyrjy
 GpmfFzM9q5mKje2N5cnZzsWz2zqiArHKIljMEI8ChHaxpD3XYH/HVWKTtjcaHt/ilP1k
 sFyTRAskVanN0W3eiyre7UcXPXV9d8IewQJa1QAAQ1LlFvIHHhcYnEMbBygAs2EGUqw3
 74/3mljsMPttmFqJhRvOXkOTc0g9DuGehEXva/BYvchXW6YyEKpKJ1z3E2uzNYKIesSf
 RBWpsHl9+IF0GnsnuiR9INF8D9oumGH2QVNmnKMvD9HgZqEuotgKIK/BHDqMiZXp+uF/
 sdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=0wiBO4Qgn2f/oAakm74MKrsEpWN33LSkfekcwpwrDqM=;
 b=RWhF2iYBirHDK40uO59PGOqfTT1OrQsiK4/dAXH80plAwEORo1L2e8720qaneylAvy
 VCVdkZldyVoo+39LVEgnWOf06jasG6VFm47B7p+o/KtEvSwrjfMNNStlnyGDrYmM3d47
 5AQew84hOQQlP83hVUkylAVLeBEaW8rz3by9Ah0EogXcnKKAFToe8SR/RclJEXpQe4Fn
 BQ7EqbNE/xmrCUDDFnove1wGPtUavjlRcEHT15KiVj63GGxFtcw/Myw5p7L2dffd/ovd
 h2aQg4LCit9Ws0j2c1/w9DzhuRTAv8vRhYFepNTMKXczOFFXGAkx+Ej5JcFxq/gcn1lq
 k7bw==
X-Gm-Message-State: ACgBeo0P9UoFnJdlIzqZxhmndGjXqUUDfQuw6cHIwgC1YaCqyrAZzB3g
 Sa0qEbzcb+pLvcMVKhpO6m8=
X-Google-Smtp-Source: AA6agR61XgdBp/nnXRnvwje5mUz5OiG+ZStCuNEt2RNzVJxXohUZML6JXaqjrEAVNuW3xEu5DvQioQ==
X-Received: by 2002:a17:906:770d:b0:73c:a08f:593c with SMTP id
 q13-20020a170906770d00b0073ca08f593cmr10133491ejm.182.1662724576959; 
 Fri, 09 Sep 2022 04:56:16 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-183-180-255.77.183.pool.telefonica.de.
 [77.183.180.255]) by smtp.gmail.com with ESMTPSA id
 kw14-20020a170907770e00b0076f0a723f6bsm190439ejc.58.2022.09.09.04.56.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 04:56:16 -0700 (PDT)
Date: Fri, 09 Sep 2022 11:56:12 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
CC: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_hw/virtio/vhost-shadow-virtque?=
 =?US-ASCII?Q?ue=3A_Silence_GCC_error_=22maybe-uninitialized=22?=
In-Reply-To: <CAAdtpL49zYJUum+Q79iWHbffy2ZCf8095WSUjvwAnnAX-j_raQ@mail.gmail.com>
References: <20220906171114.14839-1-shentey@gmail.com>
 <CAAdtpL49zYJUum+Q79iWHbffy2ZCf8095WSUjvwAnnAX-j_raQ@mail.gmail.com>
Message-ID: <CE6CBCA6-EF79-48E7-95B9-4381AA51209D@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 6=2E September 2022 17:52:24 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
f4bug@amsat=2Eorg>:
>On Tue, Sep 6, 2022 at 7:12 PM Bernhard Beschow <shentey@gmail=2Ecom> wro=
te:
>>
>> GCC issues a false positive warning, resulting in build failure with -W=
error:
>>
>>   In file included from /usr/include/glib-2=2E0/glib=2Eh:114,
>>                    from /home/zcone-pisint/Projects/qemu/src/include/gl=
ib-compat=2Eh:32,
>>                    from /home/zcone-pisint/Projects/qemu/src/include/qe=
mu/osdep=2Eh:144,
>>                    from =2E=2E/src/hw/virtio/vhost-shadow-virtqueue=2Ec=
:10:
>>   In function =E2=80=98g_autoptr_cleanup_generic_gfree=E2=80=99,
>>       inlined from =E2=80=98vhost_handle_guest_kick=E2=80=99 at =2E=2E/=
src/hw/virtio/vhost-shadow-virtqueue=2Ec:292:42:
>>   /usr/include/glib-2=2E0/glib/glib-autocleanups=2Eh:28:3: error: =E2=
=80=98elem=E2=80=99 may be used uninitialized [-Werror=3Dmaybe-uninitialize=
d]
>>      28 |   g_free (*pp);
>>         |   ^~~~~~~~~~~~
>>   =2E=2E/src/hw/virtio/vhost-shadow-virtqueue=2Ec: In function =E2=80=
=98vhost_handle_guest_kick=E2=80=99:
>>   =2E=2E/src/hw/virtio/vhost-shadow-virtqueue=2Ec:292:42: note: =E2=80=
=98elem=E2=80=99 was declared here
>>     292 |             g_autofree VirtQueueElement *elem;
>>         |                                          ^~~~
>>   cc1: all warnings being treated as errors
>>
>> There is actually no problem since "elem" is initialized in both branch=
es=2E
>> Silence the warning by initializig it with "NULL"=2E
>
>Could you amend the first line of `gcc --version`?

Hi Phil,

Yes, will do in v2=2E

Sorry for getting off-topic, but have you recognized my vt82c686 series? Y=
our opinion would matter there and I'm not sure if my mail bounced=2E In my=
 case Gmail likes to put your mail in the spam box :/

Regards,
Bernhard
>
>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>
>> Fixes: 9c2ab2f1ec333be8614cc12272d4b91960704dbe ("vhost: stop transfer =
elem ownership in vhost_handle_guest_kick")
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>  hw/virtio/vhost-shadow-virtqueue=2Ec | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/virtio/vhost-shadow-virtqueue=2Ec b/hw/virtio/vhost-sha=
dow-virtqueue=2Ec
>> index e8e5bbc368=2E=2E596d4434d2 100644
>> --- a/hw/virtio/vhost-shadow-virtqueue=2Ec
>> +++ b/hw/virtio/vhost-shadow-virtqueue=2Ec
>> @@ -289,7 +289,7 @@ static void vhost_handle_guest_kick(VhostShadowVirt=
queue *svq)
>>          virtio_queue_set_notification(svq->vq, false);
>>
>>          while (true) {
>> -            g_autofree VirtQueueElement *elem;
>> +            g_autofree VirtQueueElement *elem =3D NULL;
>>              int r;
>>
>>              if (svq->next_guest_avail_elem) {
>> --
>> 2=2E37=2E3
>>
>>


