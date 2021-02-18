Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE10B31EDBF
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 18:57:29 +0100 (CET)
Received: from localhost ([::1]:46158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCnYO-00061O-RA
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 12:57:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lCnLW-0002oB-Qj
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 12:44:12 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:32880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lCnLS-00087j-HR
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 12:44:10 -0500
Received: by mail-pg1-x532.google.com with SMTP id z68so1604618pgz.0
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 09:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Xh74tiaKTLgu6iSFVSNwadSz4xskX8HanaA+nosu/A=;
 b=Td2Sr5J5o1Z/PzUcOrqIT/3IQ5NAKiexgxuyzDqdkNFIq3Oj8rrsB0WZyBm0sQMtZR
 tDEPOX4FlzHlTtrL1rqjxy00CXfxMHkGfbbC15K08umBkjmE5wfO5YTnpsNbtRdr31Vs
 b+WM8Db/UjWIhmjUktMlqBxp3haVlX++KnVgO0hMVAxVziQmujxpHhO9jyt12s//ZIDj
 UoEF6029XTwA3sg/FKspQCDPrIvf5sxI0jUuAwmlv5EVcyPCa/WJzmlTIiQpDsCT9Ypv
 o4uR7JfN7/QgabeLyAWfHQ9sdudBKRsSt+CKi9yz3w1oDB63k+xo7DPRjuQcPqj9JIBM
 bVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Xh74tiaKTLgu6iSFVSNwadSz4xskX8HanaA+nosu/A=;
 b=VcjLrZ8R1n0qd8tVlaEtlRDW/IdmjZBqR7nMIZq4hC55VzWezQ1Kmk0azV1KTF5g4s
 274ygTa35x/6u2Dh3U9+3H2vEy3H8P2ne95ep//cL9vyqTSzArNc4qeyl1INpnx9Xn99
 23h5qknoi8/NuNF2w9WFDCEOB++IZL8Vmw04JBP8066yiNOUBRCHrFyYf5pjQBMbKCrT
 E6h9GmLfgeea032CwGtfLPjPvkX8xNzBhVYQTRN6JZhEElenz2bznuee/LFwZAc0ggzB
 nCTnLJV5D6VNvA5x4BcAiYgX6CkhsgtfqEDX+l0nv3n8iigaK3oexEoao+Xls+X486LX
 S5lA==
X-Gm-Message-State: AOAM532OOUn5FtSwLVFpg5R2BocUzvDMPo/ChPxTdO8KrsE+LLj2H6uv
 kp6CktaH41iUc0w6A3tIozgwW/kS+aMSG3Yj6XE=
X-Google-Smtp-Source: ABdhPJwZfCFi1qt998/YfwPE+9jq7ogTdqh51FACnJE3iBBuQd3kdVn3+n+GgdDB010i9pbbTnd1vf9xL/WMlchW95E=
X-Received: by 2002:a63:1723:: with SMTP id x35mr4987883pgl.393.1613670244019; 
 Thu, 18 Feb 2021 09:44:04 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QWWg__21otbMXAXWGD1FaHYLzZP7axZ47Unq6jtMvdfsA@mail.gmail.com>
 <1613136163375.99584@amazon.com>
 <CAJSP0QXEvw6o7XFk9FXudr9PmorFHiOuNRg16DjJhBgj_qC-FQ@mail.gmail.com>
 <f0493c86-e92b-8bb6-a4a9-33646bf05fab@amazon.com>
In-Reply-To: <f0493c86-e92b-8bb6-a4a9-33646bf05fab@amazon.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 18 Feb 2021 17:43:52 +0000
Message-ID: <CAJSP0QUH5Ewa=xC5wUfPTbseg=5GCAzXtNYK8c40HKikRWkxSA@mail.gmail.com>
Subject: Re: [Rust-VMM] Call for Google Summer of Code 2021 project ideas
To: Andreea Florescu <fandree@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=stefanha@gmail.com; helo=mail-pg1-x532.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Alberto Garcia <berto@igalia.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm <kvm@vger.kernel.org>, David Hildenbrand <david@redhat.com>,
 Sergio Lopez <slp@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Julia Suvorova <jusual@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Markovic <Aleksandar.Markovic@rt-rk.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 "rust-vmm@lists.opendev.org" <rust-vmm@lists.opendev.org>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 18, 2021 at 11:50 AM Andreea Florescu <fandree@amazon.com> wrote:
> On 2/17/21 1:20 PM, Stefan Hajnoczi wrote:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> >
> >
> >
> > Thanks, I have published the rust-vmm project ideas on the wiki:
> > https://wiki.qemu.org/Google_Summer_of_Code_2021
> Thanks, Stefan!
> >
> > Please see Sergio's reply about virtio-consoile is libkrun. Maybe it
> > affects the project idea?
> I synced offline with Sergio. It seems I've misread his comment.
> The code is already available in libkrun, and to port it to rust-vmm
> will likely take just a couple of days. We explored the option of also
> requesting to implement VIRTIO_CONSOLE_F_MULTIPORT to make it an
> appropriate GSoC project, but we decided this is not a good idea since
> it doesn't look like that feature is useful for the projects consuming
> rust-vmm. It also adds complexity, and we would need to maintain that as
> well.
>
> Since it would still be nice to have virtio-console in rust-vmm, I'll
> just open an issue in vm-virtio and label it with "help wanted" so
> people can pick it up.
> Can we remove the virtio-console project from the list of GSoC ideas?

Done.

> Also, iul@amazon.com will like to help with mentoring the GSoC projects.
> Can he be added as a co-mentor of: "Mocking framework for Virtio Queues"?

Done.

Thanks for getting the rust-vmm mentors together! I'm looking forward
to more Rust virtualization projects :).

Stefan

