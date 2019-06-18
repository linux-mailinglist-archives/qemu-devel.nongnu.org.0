Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DFB49649
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 02:29:05 +0200 (CEST)
Received: from localhost ([::1]:52772 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hd1zj-000196-SN
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 20:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57604)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <andrew.smirnov@gmail.com>) id 1hd1yF-0000P5-98
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 20:27:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew.smirnov@gmail.com>) id 1hd1yE-0007Ck-C8
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 20:27:31 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:34747)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
 id 1hd1yE-0007C6-4i; Mon, 17 Jun 2019 20:27:30 -0400
Received: by mail-io1-xd44.google.com with SMTP id k8so25741485iot.1;
 Mon, 17 Jun 2019 17:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t9WIkMCJzUsCK/kU6QU/SflM6UsK/eYNYbFEXibPnKg=;
 b=nm/46+e+FHzsWTPIIAhMwNsrhLG5uaMDMwhJgyn4AsmvpNYFHi6A4STUSLGJrk1bIO
 9NwUk2X+xmnUVfkdXhnk3gRX/G64CL6iaZMh4qXWzus1tYctrb5wDDG0GvJGLDi9MPr2
 eGAxxsJZc5XU8w+m23nBC/0LAiuvXL/FRXPu8nfHxT8XaeKWA3OX99RKD9ZPCLdkZZoo
 x5SumdkvOHiAZECqyayoYy5TZHXplRZqHbmCdpyxPbHklHQm7xeZa3lACA5lFLDxeL9j
 +E8WyqAj4IAmCSRIfwd9MnJyS+b6FSY5CxggPBczj2r+ddo3rpzOxpdmN+B3skFYkRFH
 qIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t9WIkMCJzUsCK/kU6QU/SflM6UsK/eYNYbFEXibPnKg=;
 b=mKpagwIC1r2QhhAULdH7pG/wU1Y6ZFMWSXiUUY32Udq0K6+YUFQjFK1KvIdyeeh5ze
 ZW1TQhdo4MCAXXNQHSCJHoFwlYFdmaqR1t05WIOBPWlidU+JqXivGFPfXnXX8zpgOoMb
 0Oijr6/Nr0LQRc0Rk7eNIYuI6lNOZFfizGM6+olECs18kpp5aP96nPJGGyEXrvHbK4n5
 kDd0v7Aln46z8GHhRSsymMwkLykikC2dS+vZq/RYUM62fiAS7BWee/eHMqK5f6sdqd+e
 TZ8A8gklu22itfYe95fj/BEnY6XRiNyyw8q9oyqDlWDXxL0+GM6ZjmGIZPHGnhXwXrba
 MN4w==
X-Gm-Message-State: APjAAAX7nlzlndg+Mz3BDjbFgVuv/VZJA4JsRngGXShUfQc+Kp6OGOm8
 9Olz65PXQ8QOLGmX6D4ncFFtjt/0rO3+a9xhvhE=
X-Google-Smtp-Source: APXvYqypZE2oksrrhg9ZO89awHo0Xi05+eK0SJz/hUAbw7PO9AZzboqoFdGwGCtmzH1oqHWzz+4QtjdJ+yDV5BR0YBU=
X-Received: by 2002:a6b:f00c:: with SMTP id w12mr1556777ioc.280.1560817648660; 
 Mon, 17 Jun 2019 17:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190416013902.4941-1-andrew.smirnov@gmail.com>
In-Reply-To: <20190416013902.4941-1-andrew.smirnov@gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 17 Jun 2019 17:27:17 -0700
Message-ID: <CAHQ1cqE5RZVYB1N2+CxGKNDb5NrtBOiQANhruZ6_6EbOThNwiw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
Subject: Re: [Qemu-devel] [PATCH 0/5] Various i.MX7 fixes
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
Cc: "open list:ARM" <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 15, 2019 at 6:39 PM Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>
> Everyone:
>
> I recently revisited my i.MX7 work and this series contains all of the
> fixes I had to make to get it to work with latest (5.1-rc1) Linux
> kernel again as well as fixes for genuine bugs that I somehow missed
> during original submission ("pci: designware" patches). Hopefully each
> patch is self-explanatory.
>
> Feedback is welcome!
>

Is there any changes necessary for this to go in?

Thanks,
Andrey Smirnov

