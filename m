Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7709D40402D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 22:27:08 +0200 (CEST)
Received: from localhost ([::1]:48446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO49z-0000an-IR
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 16:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mO48X-0007PK-Vn
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 16:25:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mO48U-0003zy-LZ
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 16:25:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631132733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rMZlzpFYK89uj7U0ExwkYup8kLC3NBqFLn5W2+Hoito=;
 b=AZqtrRoUVn3RJk3MT/njj99CFxNt6F2UM3H4rENWVeSNUH/A8NekyWay6GS0gmWt8I7g4a
 DzDfiCUnCSCZosvIjGZsn5urCq3Ldc0cpEF9unrsXXPCJ55BHlCUUDXZbQqFusGF4dyl8z
 3lJMZqI9N40UcBgAWidTyIKihQccaSw=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-q2sCRuocNmOcWnxrzbjGmg-1; Wed, 08 Sep 2021 16:25:32 -0400
X-MC-Unique: q2sCRuocNmOcWnxrzbjGmg-1
Received: by mail-lf1-f72.google.com with SMTP id
 bp18-20020a056512159200b003eb84833c98so1213786lfb.14
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 13:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rMZlzpFYK89uj7U0ExwkYup8kLC3NBqFLn5W2+Hoito=;
 b=ZMqAviFnc2kJx2jHqKGhalhlp9l0a2Py3QAl4bS7FtLB4vuw7gMhy4B9AukSaDDrD8
 OHeOuI8V7QvkeESty25MTuY98XqUEatrgTureNla3+im/ac2JZgoKDr7QgJ2ZYeDpwE2
 rf1/7WzeN7/hndarUdnfCqxsjYOVrEs0zjhGTPl+eQjO1oInuSiTfJVpopFFWO5jVJiq
 i1QM2fleyrZD8WQKQIYpKlTq8++ijCLAeyit+ULqE3ywFNjK8J5Q6l1BWe0W2sWD9weC
 SdtQVDmkoqUHyyD3fVImwxgwdtnxXHVZN7QsaiifpXqM8SqG03k23T1ml4hzJ8lIa0ji
 UnKA==
X-Gm-Message-State: AOAM533PhNjSNuED84S5JnB7bVbAwTA8UrsrERS9QNOp2ClTNQMKVJpw
 DlLW/WtHQcULGQKmTrLrThwpxJ8f2svZxYSiXnWEeSa10RVAO/IdkclvaviKj9Mg7JJQ+HYBBUW
 6GeGdINgjYP+5HLHG6dnLQaPM/3Gaoig=
X-Received: by 2002:a19:c209:: with SMTP id l9mr4015911lfc.370.1631132731231; 
 Wed, 08 Sep 2021 13:25:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfYp2IXlWuy/ug1GI6b9ofGOzBLEg9Sg5U/yBoe3LDEyqTtNUC6ZAJPIFJOBtcDzONQC2+kf1ZWdTGD9JPyfM=
X-Received: by 2002:a19:c209:: with SMTP id l9mr4015881lfc.370.1631132730848; 
 Wed, 08 Sep 2021 13:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-3-leobras@redhat.com>
 <YS4nPfEBCy9IC3rd@redhat.com>
 <CAJ6HWG75NDzaRAoHvM6FkFoB+sQvTpmdR8+AdMkoY6TsP06ZhA@mail.gmail.com>
 <YTCPngNB+l70sl06@redhat.com>
 <CAJ6HWG6dd+timQM27-NTumvwDM2bFawRsnmrZumdzGZ8hCR3dQ@mail.gmail.com>
 <YTCeNCEmr3NsQEPR@redhat.com>
 <CAJ6HWG6D61K49gyvfLo2c5=cZpkYh96ciZjO5V=wiPdG+wB5zQ@mail.gmail.com>
 <YTCnP9J/JINhg4h8@redhat.com> <YTdHpx263WNe7nuZ@work-vm>
In-Reply-To: <YTdHpx263WNe7nuZ@work-vm>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 8 Sep 2021 17:25:50 -0300
Message-ID: <CAJ6HWG6L1LOec6yMY1oxFjbjhAv4LK6beS5FmU=g_s4h2+7ouA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 7, 2021 at 8:06 AM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
> > Possibly, yes. This really need David G's input since he understands
> > the code in way more detail than me.
>
> Hmm I'm not entirely sure why we have the sync after each iteration;
> the case I can think of is if we're doing async sending, we could have
> two versions of the same page in flight (one from each iteration) -
> you'd want those to get there in the right order.
>
> Dave

Well, that's the thing: as we don't copy the buffer in MSG_ZEROCOPY,  we will in
fact have the same page in flight twice, instead of two versions,
given the buffer is
sent as it is during transmission.

For me it looks like there will be no change in the current algorithm,
but I am still
a beginner in migration code, and I am probably missing something.

Best regards,
Leo


