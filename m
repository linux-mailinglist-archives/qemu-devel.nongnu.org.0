Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA1F583CB6
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 12:59:02 +0200 (CEST)
Received: from localhost ([::1]:47956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH1EM-0004oU-2n
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 06:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oH1Cd-0003QE-Dp
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 06:57:16 -0400
Received: from mail-ua1-f48.google.com ([209.85.222.48]:33790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oH1Ca-0002NF-2k
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 06:57:14 -0400
Received: by mail-ua1-f48.google.com with SMTP id q46so585918uaq.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 03:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/UP8OmncHRrcbqvxaqJ1/AcT1aoAvwKQvZbg01wNNX4=;
 b=ejakSHOhm0rUG1xuVjbe9FDz4QovG/t0J1boNev7xNe+H7aHMZNlMMKKS/WoihDHy0
 wsXtrG7PwW6yR+dPcqtVNlC7etibRB17YU/4Sec2vK41Va0b2LPFQjDlG2MUW+pFcsbl
 VWtE+ARg2eJt0wRxydvtqgznJd26tzwIDtR20TIo5csEhol19c42nEE4fuzQcXKtL+IY
 D6XvrtOh5XD/sZuZCN2DgJ/yDrmbWl0BdBp+AxgfA4dNbHnzU9HVrPqjsR3dpdY0Oog7
 z6xYARLVDnbz15oe2/iZFogNR9Wm+fEZ7jBCAj96pRAA47nMhcrCzZiijz8XaZAXR+au
 VfZw==
X-Gm-Message-State: AJIora+1TDEzQm8FdmpvbiFpi0fREfv3Mf10wdQoTlXB4fkN7l4B5WMu
 Wkagk1RjKqtz5Q2ljtNcDy0b+gVe5HBX+uGWYAE=
X-Google-Smtp-Source: AGRyM1vDNFcbURCtdzvMw3MoAymkk9T5ERZ8nnszgR+MBTKUD9RrlESVO4ZqWefrSkcALPxak33Pw8CYkfiwGbLbekg=
X-Received: by 2002:ab0:487:0:b0:379:6745:cd1f with SMTP id
 7-20020ab00487000000b003796745cd1fmr8633790uaw.67.1659005831105; Thu, 28 Jul
 2022 03:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAE2XoE_Ki5QJSH9LNkFOzOwMFJdS=y6=bb2g=9ODawuFymADdA@mail.gmail.com>
 <YuJLKn8y7LrjnBjK@redhat.com>
 <CAE2XoE-KfoKtcepFgT9zSj6TDtu+T04=TA=4eDxumF6RNrPYyA@mail.gmail.com>
In-Reply-To: <CAE2XoE-KfoKtcepFgT9zSj6TDtu+T04=TA=4eDxumF6RNrPYyA@mail.gmail.com>
Date: Thu, 28 Jul 2022 12:56:59 +0200
Message-ID: <CAAdtpL57XKX0B7n12yH1wqOVKosD-871x4_BBjW32tH-usjNtQ@mail.gmail.com>
Subject: Re: When create a new qemu fork, can not run pipeline,
 what I need to do?
To: Yonggang Luo <luoyonggang@gmail.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-level <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.222.48;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ua1-f48.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Thu, Jul 28, 2022 at 11:29 AM =E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo)
<luoyonggang@gmail.com> wrote:
> On Thu, Jul 28, 2022 at 4:39 PM Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
> > On Wed, Jul 27, 2022 at 07:20:51PM +0800, =E7=BD=97=E5=8B=87=E5=88=9A(Y=
onggang Luo) wrote:
> > > =C2=B7=C2=B7=C2=B7
> > > Pipeline cannot be run.
> > >
> > > No stages / jobs for this pipeline.
> >
> > No jobs are created until you set 'QEMU_CI=3D1', which creates jobs and
> > lets them be manually started, or set 'QEMU_CI=3D2' which creates jobs
> > and runs them all immediately. Please see:
> >
> >   docs/devel/ci-jobs.rst.inc
> >
>
> Thanks, I've tried to locate this but not found it

See here:
https://www.qemu.org/docs/master/devel/ci.html#custom-ci-cd-variables

