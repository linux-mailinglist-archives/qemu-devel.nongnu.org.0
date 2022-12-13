Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D6E64B72D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 15:20:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p568O-0008G4-RI; Tue, 13 Dec 2022 09:19:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1p567p-0008Al-SJ
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 09:19:22 -0500
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1p567n-0002S6-Rq
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 09:19:17 -0500
Received: by mail-lj1-x230.google.com with SMTP id z4so3423227ljq.6
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 06:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5yHgp/VoF9gZu+i6pJs7n9jW3Jju/fnFJeIae/2+uaE=;
 b=GXO94Hp1l8iCHk771siZFGpR6nKWDMPZLIWZq3CtkkQd+fOUA/pTguz9J99BV9550z
 RclrmLLJ920pxg4S+seKHbJ+o6ZtqgqNLAGLR6NeLNBKF6rK6b6FxdlJ8i6wVY9dbPTe
 AgfMTOrpkAvAzCYOTTi5TurMcod0cua7qcrICGIq8SAUsUhfj5i1RzZrp18WNnrVS/67
 JMyzVX+rs7vJsYOw54JakuUGfqelypYJ9tht6N/9z6YzdybhmgwmQIJteB5o98hsfHNz
 uy2XLfP1imtTrn2E+YLX2QR5pHXym/xPVF8MCQ9eR6XDpLMszoTD/ssOqP0u2xjPi96P
 DPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5yHgp/VoF9gZu+i6pJs7n9jW3Jju/fnFJeIae/2+uaE=;
 b=YKNzsRlelBeygwgd9JysUAFmN1zgg3aV/Mka0LFx9fbYVzFaHRIQV9y7qm6PgpNk1T
 ornPQtcis6G8ZV3rgkPdH92lJIAX7INKb4zyUBZEt6Zr7ukdloKSksd/+5U2hDIxoNG8
 pQNf211QzDJN4WeJfwtFnDlusAaUW3tuaOyepT9ng7VY0tlQmpcTcNFkBqivG5aLUPOD
 FoMeIxkj6DE38Mb8FpwIoWYt/BcTbq1tNlurNjOAe1jVLzA/48wRh+h/H6XlZs3OS+vn
 z9Zu4/zPjJsbTL9Uw8WViiwfFNXDSlkc5aG95hKnkHmJy7VD8GG4hVpc9ZnbZ/6FOf2i
 IDXA==
X-Gm-Message-State: ANoB5pmshkTDHFpHYXyVbM1taU4bg0A4pgdBYobTBvuMcq29WbWLWPxi
 j9wrCBwe0bU60oA2AvGI0LM=
X-Google-Smtp-Source: AA0mqf4BOHjTOPGKqjgZFt5R4R8FsIyjHgjl2WvhS83Gf4OFkwQWvZP9ElPMKJStIWkn8Yy7R+eSbQ==
X-Received: by 2002:a2e:9b4d:0:b0:27b:4920:d942 with SMTP id
 o13-20020a2e9b4d000000b0027b4920d942mr2849399ljj.31.1670941153902; 
 Tue, 13 Dec 2022 06:19:13 -0800 (PST)
Received: from gmail.com (81-232-4-135-no39.tbcn.telia.com. [81.232.4.135])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a2e82d6000000b0027628240ff7sm272521ljh.135.2022.12.13.06.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 06:19:13 -0800 (PST)
Date: Tue, 13 Dec 2022 15:19:12 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Mark Burton <mburton@qti.qualcomm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Warner Losh <imp@bsdimp.com>,
 Luc Michel <luc@lmichel.fr>, Paul Walmsley <paul.walmsley@sifive.com>,
 Alessandro Di Federico <ale@rev.ng>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Michal Privoznik <mprivozn@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Denis V. Lunev" <den@virtuozzo.com>, Cleber Rosa <cleber@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Dominik Csapak <d.csapak@proxmox.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Dongli Zhang <dongli.zhang@oracle.com>, afaerber@suse.de,
 andrea.arcangeli@redhat.com, bazulay@redhat.com, bbauman@redhat.com,
 cjia@nvidia.com, cw@f00f.org, digitaleric@google.com,
 dustin.kirkland@canonical.com, Eric Blake <eblake@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, felipe@nutanix.com,
 iggy@theiggy.com, Jan Kiszka <jan.kiszka@web.de>,
 Jason Gunthorpe <jgg@nvidia.com>, jidong.xiao@gmail.com,
 jjherne@linux.vnet.ibm.com,
 Joao Martins <joao.m.martins@oracle.com>, mburton@qti.qualcom.com,
 mdean@redhat.com, mimu@linux.vnet.ibm.com, z.huo@139.com,
 zwu.kernel@gmail.com, Laurent Vivier <lvivier@redhat.com>
Subject: Re: Single system binary & Dynamic machine model (KVM developers
 conference call 2022-12-13)
Message-ID: <Y5iJ4JEhCONY07vi@toto>
References: <936e1ac4-cef8-08b4-c688-e5b1e057208b@linaro.org>
 <1ac96aab-c5c4-b539-956c-d2923e6d8602@linaro.org>
 <CAJSP0QUMRipTMiYMSftQQe+A3aaF553KpJeSgBaS9vY7X4aD0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJSP0QUMRipTMiYMSftQQe+A3aaF553KpJeSgBaS9vY7X4aD0w@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Tue, Dec 13, 2022 at 09:17:40AM -0500, Stefan Hajnoczi wrote:
> On Tue, 13 Dec 2022 at 09:08, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> >
> > On 12/12/22 00:41, Philippe Mathieu-Daudé wrote:
> > > Hi,
> > >
> > > In the last years we had few discussions on "simplifying" QEMU (system
> > > emulation / virtualization), in particular for the "management layer".
> > >
> > > Some of us are interested in having QEMU able to dynamically create
> > > machine models. Mark Burton's current approach is via a Python script
> > > which generates QMP commands. This is just another case of "management
> > > layer".
> > >
> > > Various problems have been raised regarding the current limitations of
> > > QEMU's APIs. We'd like to remember / get a broader idea on these limits
> > > and look at some ideas / proposals which have been discussed / posted
> > > on this list.
> > >
> > > Feel free to complete your thoughts on this public etherpad:
> > > https://etherpad.opendev.org/p/qemu-emulation-bof%402022-12-13
> > >
> > > Topic I remember which can be good starters:
> > >
> > > - Current limitations of QAPI (& QMP) model (Markus Armbruster)
> > >
> > > - Adding a new qemu-runtime-$TARGET / QMP-only binary without today's
> > >    limitations (Daniel P. Berrangé & Paolo Bonzini)
> > >
> > > - Problem with x-exit-preconfig, reworking MachinePhaseInit state
> > >    machine (Paolo Bonzini)
> > >
> > > Markus / Daniel / Paolo expressed their ideas on the list (the
> > > historical threads are referenced in the etherpad) so reading the
> > > relevant threads before the call will help to get in the topic.
> > > These people don't have to be in the call, but if they can attend
> > > that would be very nice :)
> > >
> > > The call will be Tuesday, December 13 at 3pm CET on this Bluejeans link:
> > > http://bluejeans.com/quintela
> > We moved the call here:
> >
> > https://teams.microsoft.com/_#/pre-join-calling/19:meeting_MjU2NDhkOGYtOGY5ZC00MzRjLWJjNjgtYWI2ODQxZGExMWNj@thread.v2
> 
> Please use a video conferencing system that allows people to join
> without logging in and works across browsers. I gave up on Teams.
>

I'm also unable to join, sorry!

Best regards,
Edgar

