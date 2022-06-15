Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8F854C3BC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 10:42:02 +0200 (CEST)
Received: from localhost ([::1]:53374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1ObB-000391-S7
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 04:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1o1OI1-0007CC-HI
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 04:22:13 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:34599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1o1OHz-0000JZ-QA
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 04:22:13 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1011df6971aso13147350fac.1
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 01:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KW3RakeSw5wBJASeMYyMQjcGPIm5G7QxIQ/ZDEOUTGw=;
 b=SZ4V/dSo57pgydCzD+ffaRvI+Curoa1L94QQZET3EQ2HFkRbqxxgFsDQeEm8lFANfu
 vi54UQxnJdr81FJNNkBP90Lgrn0NbJeQ3zRiJacA/yXcSOI9tGiu9Tx2NDmDeLzkeiCG
 pyU+CExlRYfcy0YT9stTz2tgJkMAOQwQ5cFt1RuGfRzRvR9tuymin98mR3iZpor73Dgp
 W4bxEI6bGEZWS+iOyzeXyiI5ahuIkA8+gbVdTrPIoG3zZrEqKDnU5kITkGflUnSSdwIl
 6vBqJkbmc7x1lFrYxBzs/mz9U6erYFb+ez0YPS9u9QmRsWI//4rnl2Om/djIMCee6UxG
 fNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KW3RakeSw5wBJASeMYyMQjcGPIm5G7QxIQ/ZDEOUTGw=;
 b=YNDkNe5OqFmnYanlxjt/ZtYuJve+EzmbQn15NHxnYNTWdXkJ4FxwgYDJZzN2gXuH/P
 bqZ1p7fuYGIHLInnv83mnvMe5cxzesu2Ay0rXU3CE1tZFGPWlQdRWw0uox3c1Zcqsd+M
 mXdZBC6Ywrc9grko/mi0d/qF50t5PyRiYZ/V/PgdZIXAlPM+7RwYvBepR9085p908JsZ
 ikkRs0upDoYa7oKh/hMI3qDXT7aPnfO00JW2LzFBhiBVWzfAAEeQjFn5b92fCv68HgJL
 c/HNyyahW/XIRy+BbvtJOcB47Swyq2xhSlKYU1agx6F04bdzZWH2S7hOF+jt2qnBWsSo
 5KQQ==
X-Gm-Message-State: AJIora8gCYhRV6NjKLhgMgBJ+l4FYG78xJb7l3ng/hUWL0tKE2kdf5G9
 GO8UaZJwFY4KHltvFPAjj/PDNvLYbmMfcq/BuGI=
X-Google-Smtp-Source: AGRyM1vYmTDlqMfJ44TN1oOFV9XzEPRif9ngCYbf1ruXPRYbHp/cBLog3dhphjkLoDHLdWqIbKwH82UIZ52dQqFWYJg=
X-Received: by 2002:a05:6870:204c:b0:101:6275:67de with SMTP id
 l12-20020a056870204c00b00101627567demr3561496oad.101.1655281330195; Wed, 15
 Jun 2022 01:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1655151679.git.jag.raman@oracle.com>
 <YqgzX2K9X9wLMZmC@stefanha-x1.localdomain>
 <94C1BA50-A498-4A98-A970-2E7C39C97BA6@oracle.com>
 <Yqi27QRzSnL8tN/2@stefanha-x1.localdomain>
In-Reply-To: <Yqi27QRzSnL8tN/2@stefanha-x1.localdomain>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 15 Jun 2022 09:21:58 +0100
Message-ID: <CAJSP0QVm3_BQCweongyCfoygbKY7BD+gHOo0xyPD6N4qR4pVEw@mail.gmail.com>
Subject: Re: [PATCH v12 00/14] vfio-user server in QEMU
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Jag Raman <jag.raman@oracle.com>, qemu-devel <qemu-devel@nongnu.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, 
 "f4bug@amsat.org" <f4bug@amsat.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "thuth@redhat.com" <thuth@redhat.com>, 
 "bleal@redhat.com" <bleal@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, 
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "eduardo@habkost.net" <eduardo@habkost.net>, 
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "eblake@redhat.com" <eblake@redhat.com>, 
 "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>, 
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>, 
 "peterx@redhat.com" <peterx@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>, 
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
 John Johnson <john.g.johnson@oracle.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=stefanha@gmail.com; helo=mail-oa1-x2b.google.com
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

On Tue, 14 Jun 2022 at 17:38, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Tue, Jun 14, 2022 at 02:37:02PM +0000, Jag Raman wrote:
> > > On Jun 14, 2022, at 3:06 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > >
> > > On Mon, Jun 13, 2022 at 04:26:20PM -0400, Jagannathan Raman wrote:
> > >> This is v12 of the server side changes to enable vfio-user in QEMU.
> > >>
> > >> Thanks so much for reviewing this series and sharing your feedback.
> > >>
> > >> We made the following changes in this series:
> > >> [PATCH v12 13/14] vfio-user: handle device interrupts
> > >> - Renamed msi_set_irq_state() and msix_set_irq_state() as
> > >>   msi_set_mask() and msix_set_mask() respectively
> > >> - Added missing return statement for error case in msi_set_mask()
> > >
> > > Thanks, applied to my block tree:
> > > https://gitlab.com/stefanha/qemu/commits/block
> >
> > Thank you very much, Stefan! :)
>
> You're welcome! Thanks for the persistence in getting the vfio-user
> server into QEMU.
>
> I have mirrored libvfio-user here:
> https://gitlab.com/qemu-project/libvfio-user
>
> The QEMU project's policy is to mirror dependencies so full source code
> can be provided even in the event that dependencies become unavailable.
> The mirror is currently manually updated, so please ping me if you want
> newer commits.

I have semi-automated the mirroring. As long as I use my laptop the
repo will be kept up-to-date. :)

Stefan

