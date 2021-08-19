Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B783F24D3
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 04:38:20 +0200 (CEST)
Received: from localhost ([::1]:40136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGuQE-0008O0-Sl
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 22:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.kalghatgi@samsung.com>)
 id 1mGuPJ-0007am-OX
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 22:37:21 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:25887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.kalghatgi@samsung.com>)
 id 1mGuPG-0003Bs-Ma
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 22:37:21 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210820023708epoutp0412dac76ec1308a4beecff9cbbeca6b6d~c4z-Tv9YI2470924709epoutp041
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 02:37:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210820023708epoutp0412dac76ec1308a4beecff9cbbeca6b6d~c4z-Tv9YI2470924709epoutp041
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1629427028;
 bh=772SFlU0Bn5D7rgfArVhhAXzPV/9tLgQ/gPex3X88rk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pAfLPXluBGbsKKPwrIshcqgVA3m9dKlSZDp6TFooufTf2RvhXKR3Es0XBev4CS+y2
 oPK/EgSI+J1tYwyeYftXA12T3KsgumacAVjEm8Ts7Rt/eZu/rA5Dl5JwYkz432CzEu
 jsyCKVreHraDZq87B45AGkrD9W/a+/kZ2hT6jX0I=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210820023707epcas5p2061db9dccb7bfb2431c01663ee771ef0~c4z_xi0Ad2381523815epcas5p2_;
 Fri, 20 Aug 2021 02:37:07 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.174]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4GrQkw5S1mz4x9Px; Fri, 20 Aug
 2021 02:36:56 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 DC.74.41701.6451F116; Fri, 20 Aug 2021 11:36:54 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20210819171636epcas5p1d4f314b2e976a1beff2c39aed227b7c3~cxKlDVN9t2882728827epcas5p1W;
 Thu, 19 Aug 2021 17:16:36 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210819171636epsmtrp2e0bd9f627affba2d246e2c9f96aea7b4~cxKlCURCC1510115101epsmtrp2y;
 Thu, 19 Aug 2021 17:16:36 +0000 (GMT)
X-AuditID: b6c32a4b-0abff7000001a2e5-a2-611f1546590a
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 47.96.32548.4F19E116; Fri, 20 Aug 2021 02:16:36 +0900 (KST)
Received: from test.sa.corp.samsungelectronics.net (unknown [107.108.56.58])
 by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210819171632epsmtip22b32abbc2a456cf12ec0afb6b17e6038~cxKhJLxV-1420314203epsmtip2b;
 Thu, 19 Aug 2021 17:16:32 +0000 (GMT)
Date: Thu, 19 Aug 2021 22:04:11 +0530
From: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [RFC PATCH: v3 1/2] add mi device in qemu
Message-ID: <20210819163411.GB32433@test.sa.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <YRyiH7aLzBh/Cko5@apples.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMJsWRmVeSWpSXmKPExsWy7bCmlq6bqHyiwbkGEYs59y0s3n59wGZx
 Zf95Rov9B7+xWjy+85ndYul8fYuTjXtYLSYdusZoseRiqsX8ZU/ZLda8ULaYd0vZ4sqURcwW
 s961s1kc793BYvF60n9Wi5vNT9kcBD1+nGtn8zi34zy7x6ZVnWwem5fUezy5tpnJ4/2+q2we
 fVtWMQawR2XbZKQmpqQWKaTmJeenZOal2yp5B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl
 5gBdr6RQlphTChQKSCwuVtK3synKLy1JVcjILy6xVUotSMkpMCnQK07MLS7NS9fLSy2xMjQw
 MDIFKkzIzni34TJbwTmxikc9+5kbGOcJdjFyckgImEg86/rN3sXIxSEksJtRYvW2hcwQzidG
 iYvnNrJBOJ8ZJbrOLWKFafmzcTtUYhejxJ3Fi5kgnEYmiTtPNzGCVLEIqEr8WvkMaBYHB5uA
 kcT3VluQsIiAisTTf3tZQOqZBd4zSbR+aWYCSQgLmEms6LrGDlLPK+AhsWmDPEiYV0BQ4uTM
 JywgNifQmK9vL4CViwLNmXJyG9gREgIXOCRaVrcyQlznItG1dwEThC0s8er4FnYIW0ri87u9
 UA3NjBL7vlxhgXAmMEpMmf8OqsNe4uKev2A2s0CGxOs9HVA/y0pMPbUOKs4n0fv7CVQ9r8SO
 eTC2qsTjCwfZIGxpidkrPzGBfCMB9M2tO5ogYSGBQ4wS23eITmCUn4XkuVlItkHYVhKdH5qA
 bA4gW1pi+T8OCFNTYv0u/QWMrKsYJVMLinPTU4tNC4zzUsvhMZ6cn7uJEZy6tbx3MD568EHv
 ECMTByPQVg5mJRFeVT75RCHelMTKqtSi/Pii0pzU4kOMpsC4msgsJZqcD8weeSXxhiaWBiZm
 ZmYmlsZmhkrivLqvZBKFBNITS1KzU1MLUotg+pg4OKUamHh5zb82x5k23eick/Fj5wxz1c8M
 HsXqoj4b9zgvkFXe3zUzQ6AxsMK5y2VC+4f13Zdq+ySOFF5YeWxJxsZFHvw7mANlV9i2x6al
 rjrX+TTNd1aTTqRy+GLbwpTq99qafCdrLl1cp9t+fsuiOEO96gtOt7bwlqcdXrkgbTFv7M+W
 K9pbwoWSf/QsPM1z++vPeR6pFzvDq89dqY+MYf/0X+3GqWVMm5ovGbPsyV6/fU7JMvFir2nN
 7Yrxb2+edTwwS+3Uw2T+/97KHvvjZvpaxQZ7/U5d3b8t5brjj939OcxaLJNPSd08tubi+nR2
 EYWwmt1KL5WW31/9fHnYN7PX3A8vZi69DTTReH/GtI7XSizFGYmGWsxFxYkACGlI7GYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRmVeSWpSXmKPExsWy7bCSvO6XiXKJBmc/C1vMuW9h8fbrAzaL
 K/vPM1rsP/iN1eLxnc/sFkvn61ucbNzDajHp0DVGiyUXUy3mL3vKbrHmhbLFvFvKFlemLGK2
 mPWunc3ieO8OFovXk/6zWtxsfsrmIOjx41w7m8e5HefZPTat6mTz2Lyk3uPJtc1MHu/3XWXz
 6NuyijGAPYrLJiU1J7MstUjfLoErY9fSvSwFDSIVG28sZmlgfMXXxcjJISFgIvFn43a2LkYu
 DiGBHYwSH1b1MkEkpCX2PbzOAmELS6z895wdoug/o8S7bbvYQRIsAqoSv1Y+Y+5i5OBgEzCS
 +N5qCxIWEVCRePpvLwtIPbPAeyaJGfvngdULC5hJrOi6xg5SzyvgIbFpgzzEzEOMEo0dy5hB
 angFBCVOznwCtpgZqH7e5odg85mBDlr+jwMkzAm06uvbC2B3igLtmnJyG9sERsFZSLpnIeme
 hdC9gJF5FaNkakFxbnpusWGBUV5quV5xYm5xaV66XnJ+7iZGcMRpae1g3LPqg94hRiYORqDT
 OJiVRHiP/ZFNFOJNSaysSi3Kjy8qzUktPsQozcGiJM57oetkvJBAemJJanZqakFqEUyWiYNT
 qoEppFza49fsT6v9DjSaVOinBMzh2FYg+LJP63/IZhHNz3yva6LXF53cFsKjFDX9o0yXgGKz
 ov1vl3VipuxH7oq9jO6N8hI+5s8gcXsuY3i3TYmKfMW3I9svCuWskn6158+h3kv3luS/TBOs
 uCz+51uP1Es/u8TcM56P18/7cPLZXplkmXUt8gu7Z1vF7zq2QPD61vk3LjydVvZgWV9lxnd9
 00Ov1K9Jdmj8Nm156/60+5ttheHCHxaedvzJB7SLjs6K/pbTpTuX17pcYstyz2+XJf4cZP3B
 dCT8I6dQ6pmMx5kR6zvMZb8XHBPY/eBeb/KX0KyKuwpd8q5vz+w942x5+vi8esuUUwmvLBU3
 qbUosRRnJBpqMRcVJwIAIIUHvicDAAA=
X-CMS-MailID: 20210819171636epcas5p1d4f314b2e976a1beff2c39aed227b7c3
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----BPyR4Tz2JvO_1Z3EIRp6YQRj0IgbPvNniido9NqUhbSkaY-S=_74c54_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210803080737epcas5p1c9bd6ecde8700d1194748533a3812db6
References: <CGME20210803080737epcas5p1c9bd6ecde8700d1194748533a3812db6@epcas5p1.samsung.com>
 <1627975487-1640-1-git-send-email-p.kalghatgi@samsung.com>
 <YRyiH7aLzBh/Cko5@apples.localdomain>
Received-SPF: pass client-ip=203.254.224.34;
 envelope-from=p.kalghatgi@samsung.com; helo=mailout4.samsung.com
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, arun.kka@samsung.com,
 jg123.choi@samsung.com, qemu-block@nongnu.org, k.jensen@samsung.com,
 d.palani@samsung.com, qemu-devel@nongnu.org, linux-nvme@lists.infradead.org,
 mreitz@redhat.com, u.kishore@samsung.com, stefanha@redhat.com,
 kbusch@kernel.org, javier.gonz@samsung.com, prakash.v@samsung.com,
 mohit.kap@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------BPyR4Tz2JvO_1Z3EIRp6YQRj0IgbPvNniido9NqUhbSkaY-S=_74c54_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Wed, Aug 18, 2021 at 08:01:03AM +0200, Klaus Jensen wrote:
>On Aug  3 12:54, Padmakar Kalghatgi wrote:
>> From: padmakar <p.kalghatgi@samsung.com>
>>
>> This patch contains the implementation of certain commands
>> of nvme-mi specification.The MI commands are useful to
>> manage/configure/monitor the device.Eventhough the MI commands
>> can be sent via the inband NVMe-MI send/recieve commands, the idea
>> here is to emulate the sideband interface for MI.
>>
>> The changes here includes the interface for i2c/smbus
>> for nvme-mi protocol. We have used i2c address of 0x15
>> using which the guest VM can send and recieve the nvme-mi
>> commands. Since the nvme-mi device uses the I2C_SLAVE as
>> parent, we have used the send and recieve callbacks by
>> which the nvme-mi device will get the required notification.
>> With the callback approach, we have eliminated the use of
>> threads.
>>
>> One needs to specify the following command in the launch to
>> specify the nvme-mi device, link to nvme and assign the i2c address.
>> <-device nvme-mi,nvme=nvme0,address=0x15>
>>
>> This module makes use of the NvmeCtrl structure of the nvme module,
>> to fetch relevant information of the nvme device which are used in
>> some of the mi commands. Eventhough certain commands might require
>> modification to the nvme module, currently we have currently refrained
>> from making changes to the nvme module.
>>
>> cmd-name                              cmd-type
>> *************************************************
>> read nvme-mi ds                        nvme-mi
>> configuration set                      nvme-mi
>> configuration get                      nvme-mi
>> vpd read                               nvme-mi
>> vpd write                              nvme-mi
>> controller Health Staus Poll           nvme-mi
>> nvme subsystem health status poll      nvme-mi
>> identify                               nvme-admin
>> get log page                           nvme-admin
>> get features                           nvme-admin
>>
>> Signed-off-by: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
>> Reviewed-by: Klaus Birkelund Jensen <k.jensen@samsung.com>
>> Reviewed-by: Jaegyu Choi <jg123.choi@samsung.com>
>>
>
>My Reviewed-by here was added by mistake. I've not given it my formal
>R-b, but I'll provide a proper review on-list ASAP.
>
>But just glossing over it, I like this approach a lot better than v1
>(vsock).

Apologies for the mistake. Looking forward for the feedback on the i2c
implementation.

------BPyR4Tz2JvO_1Z3EIRp6YQRj0IgbPvNniido9NqUhbSkaY-S=_74c54_
Content-Type: text/plain; charset="utf-8"


------BPyR4Tz2JvO_1Z3EIRp6YQRj0IgbPvNniido9NqUhbSkaY-S=_74c54_--

