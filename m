Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2E87D6E4
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 10:06:14 +0200 (CEST)
Received: from localhost ([::1]:46288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ht66H-0001n0-99
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 04:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47768)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@gmail.com>) id 1ht65l-0001N3-Pr
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 04:05:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1ht65k-0003nR-Rd
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 04:05:41 -0400
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:36662)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1ht65k-0003nH-Nr
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 04:05:40 -0400
Received: by mail-qt1-x841.google.com with SMTP id z4so69371523qtc.3
 for <qemu-devel@nongnu.org>; Thu, 01 Aug 2019 01:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9ETesHIETY97Y/B4OkF911h336xnIQGL7lSZvLlhWOo=;
 b=a10PYfOn0xNDLt1x7915r7qLLWnKQTmnAkdBbVquaPtzVpYiJe+NiYG/Qzw5xjJYNC
 y91JJrRlle7zSw8g/ISzPleV02Gf9dYoGgLQ6Q0HPcC0r/p8UjquNiGG8l4W6MWdi8RQ
 wpPyGumvKUWsUT3I1+EgSkyf4vYPVtVof6AVcRar9BJMf5W3vbuUO36/W94Al5WPD9Gg
 s50NGkMc7y1zRAx1xsJGElVCzyuEK8Kz4SZGwl8Thxl9+z1A4eRkz/YFIStlfraBp5IP
 uVEuuAXBZBGnyvuE50JeR/6Jp2G3Rqo4MjRM7o4dWwFfkLKg0QCSXbNEszyCAJrhgO/G
 XFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9ETesHIETY97Y/B4OkF911h336xnIQGL7lSZvLlhWOo=;
 b=JPASKSc6wp78azQX41uCKpbFwhUOK/hasiigDOhosk2sP5lCk/RWPNOQ0Ee6R67wWF
 LMciAm/NGuGZIsUjpPEzHJTnNKWrDBGSedqlDOtiZCUsGuYNVDq/OXEG5+kn5YJm1T1e
 W29ozMosigIVgNbdC99/W/hCx01xUHuH++OIBBTvgBDEN5Pp5DcEGpDohi/XdjOQriUQ
 MrJZ5C/jucqn4riKhV+5DfnFOtjsZdZPGAWlxqlRZIbt3UivBAwAJSj3F/sXKKsBcsyu
 51+jwcfpzD9AhEnREWCzKmAWIiEfeDcgRLaf3+ZpBcCgES2tFqF1Iz8t0Wbzt/p0XxFY
 EiRQ==
X-Gm-Message-State: APjAAAW8IB6BDZ3K3bTDlohEYgNzWr62Bu5VQHMrYUMfzoqrj2pakVvm
 zjj/x0stPExo1ruMj904gj1YjHs1Xd+L9eg3b+c=
X-Google-Smtp-Source: APXvYqyxV34wsbi6gP/TJdTH+e2DciPJkCC9PaFnvWZn9G7QgpyxkQ3AnmM8GmZXpwEdyKzrPCjhLrNuYv8PTFG5fZM=
X-Received: by 2002:ac8:4687:: with SMTP id g7mr25782239qto.213.1564646740024; 
 Thu, 01 Aug 2019 01:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190801004053.7021-1-richardw.yang@linux.intel.com>
In-Reply-To: <20190801004053.7021-1-richardw.yang@linux.intel.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 1 Aug 2019 09:05:28 +0100
Message-ID: <CAJSP0QW9aDPYrxxNMgf=d=A52sJghu+N3gyZXWOagORkAKg3oA@mail.gmail.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::841
Subject: Re: [Qemu-devel] [PATCH v2] docs/nvdimm: add example on persistent
 backend setup
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
Cc: Pankaj Gupta <pagupta@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 1, 2019 at 1:41 AM Wei Yang <richardw.yang@linux.intel.com> wrote:
> Persistent backend setup requires some knowledge about nvdimm and ndctl
> tool. Some users report they may struggle to gather these knowledge and
> have difficulty to setup it properly.
>
> Here we provide two examples for persistent backend and gives the link
> to ndctl. By doing so, user could try it directly and do more
> investigation on persistent backend setup with ndctl.
>
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Reviewed-by: Pankaj Gupta <pagupta@redhat.com>
>
> ---
> v2: rephrase the doc based on Stefan Hajnoczi's suggestion
> ---
>  docs/nvdimm.txt | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

