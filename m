Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DC02B1A23
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 12:37:29 +0100 (CET)
Received: from localhost ([::1]:40746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdXOS-0003B8-2A
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 06:37:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdXNR-0002iu-HU
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:36:25 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:41405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdXNP-0007pD-Jm
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:36:25 -0500
Received: by mail-ej1-x62c.google.com with SMTP id cw8so12888671ejb.8
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 03:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J41XKOdUFKgzKBuSpsXiZzK0sdOFQ+lT+f1rDw8F7Kg=;
 b=tlPa7QH/v9kJYC0sqCnpb5Oq6cxKUAA0kTl89pTuEJGWU2f3J0ukakH5JNWFbzHbqO
 dJk5fOo3kt8q767cMEG4UOiN7nQ3t0QRMNBso1Z8xljwwTqI4Jn4+SWy8QuWDUwaT3Ll
 Y+lULK4AY6rmFQ28FNEpJyNEwbRv+ZBkKLyBle0z4e9tOu9DKmlMy511z+1rf0BTPhD1
 S4GBxxuK6AmN3F72upr+sSqI+zwcF4gFBFf75g2RnlvLk0GrM0Z8uHxUBLlKp8HXeuIK
 x9dYPC2JAWt+OiexQqhxn/X3XykC9AphUDuNhIqXOGe6l3rC4Dj5hKeFBTRNuxFrwUrW
 naiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J41XKOdUFKgzKBuSpsXiZzK0sdOFQ+lT+f1rDw8F7Kg=;
 b=B5MBj5dhsWUo9R0TMu74ns8A5xFzlxAtyd3etmxlvd5/RwtgNUBeK+YNlC3xTRV1Jt
 uaigZPEYd82JB9LAsaXNTaAt8iHftozgt09b1aP1wzhMcJphmOOH0U5uNzHP65nVn/rD
 7UsbAEx5/TE0YTEBe7Vje3qWrIwKpFOWaSXIBqXdxOBAbll/ZVhQHdcC58s7I+6podoO
 Jn5vGl6ViLJHlIKE6f3QPuhUv1GNwXXm2mox6nlDT0lP5HvA5qifRUNmSzP317398Sjb
 755aaxRlVfNdfLN+UccyShOV4mWshb77as0itvtYVkhretD1waWryeo5h6h/5FTCNGR0
 ZjQg==
X-Gm-Message-State: AOAM532FytuQHCHkYp0ErDU0sKP8AMVY6HcUghQcQNbIUMfwP957NqX4
 5fJF7reTSUDIjc11PQezr0VKvPFRu2imo3jNZk+vPA==
X-Google-Smtp-Source: ABdhPJyccz/mNxNnt0jXeHLd+PuQA/V2CeikPUEbP072C6O+6o7QkbQCYal6Qt3vJNsvJo0Hdiz7/OAPne16lNx7KkM=
X-Received: by 2002:a17:906:7254:: with SMTP id
 n20mr1403190ejk.382.1605267381468; 
 Fri, 13 Nov 2020 03:36:21 -0800 (PST)
MIME-Version: 1.0
References: <160522223115.22563.1877553897618141184.stgit@gimli.home>
In-Reply-To: <160522223115.22563.1877553897618141184.stgit@gimli.home>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Nov 2020 11:36:09 +0000
Message-ID: <CAFEAcA_QpekmHFSfJ6FGQK1M1ojSYLKsrHUqq2JbbhTyfxgxpw@mail.gmail.com>
Subject: Re: [PULL 0/1] vfio fix for QEMU 5.2-rc2
To: Alex Williamson <alex.williamson@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, David Edmondson <dme@dme.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 12 Nov 2020 at 23:07, Alex Williamson
<alex.williamson@redhat.com> wrote:
>
> The following changes since commit cb5d19e8294486551c422759260883ed290226d9:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-macppc-20201112' into staging (2020-11-12 11:33:26 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/awilliam/qemu-vfio.git tags/vfio-update-20201112.0
>
> for you to fetch changes up to e408aeef8663fd6e3075aef252404c55d710a75e:
>
>   Fix use after free in vfio_migration_probe (2020-11-12 15:58:16 -0700)
>
> ----------------------------------------------------------------
> VFIO update 2020-11-12
>
>  * Fix coverity reported use-after-free (Kirti Wankhede)
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

