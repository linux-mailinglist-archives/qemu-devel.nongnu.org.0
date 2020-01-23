Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BA614725D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 21:07:11 +0100 (CET)
Received: from localhost ([::1]:32960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuikw-0002Cf-Ed
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 15:07:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52108)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iuhYt-0007DM-Pq
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 13:50:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iuhYs-0004uU-Mq
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 13:50:39 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:33908
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iuhYs-0004tn-Ij
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 13:50:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579805437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ym2ZnIn6DJHuCBlEpmQK1itaMcPQUVLh0wR2Y30O80=;
 b=Zc6Fm7LG7cfYWctUSZVpsjqlPFHXf9RoeEiXdQlEJHGO5o80I8t5P5d9okZfe7bL27CqPJ
 ABMs820apdpokCIQnQKfrMpW37fJ6jbw+RZQm//WO8VR+1H5K19u86loXshmRO3K7IdyQy
 Dgk3hxwiJW4qNemjqHR7fU/PeKqQMAI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-uaAofNa3MbakvhfoBhuHlw-1; Thu, 23 Jan 2020 13:50:35 -0500
Received: by mail-wr1-f70.google.com with SMTP id z14so2388884wrs.4
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 10:50:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PDuXhL4+ynW7OarAz9Uv9IC4Fs55OLcr0k+w9ly7ULI=;
 b=rJlDWCLk4UVKDsNAtHfNBBIAjcTHfZfmiOhvviT31R924bqaUifX43l5Bso867fLRy
 updW1jaVTaYYdDboM8KPIMYmZW2d+AcD5NWJgSOyjYy9DH+M5DzRFjxhn4/1pX4Asd9Z
 fBdfblluuyPobFDFrnfAiThZ++6CPj7tZ0hChkK363BUXzx6bIQuB78LWTAbwHYpVru0
 5R/Kmnma0rgo/Y5OGxNKcXX7Http9jyZgkThF+/0rYyxz+8Fa7DmxxDd4DjDcaGUVkj0
 yd1LMq4GFYZvLqgBqoJ9TKFSZ0CM4eZ4Re7Zz7YptQDjvRAutI9/sQ5GZZY8ueQFx2Nl
 qTmg==
X-Gm-Message-State: APjAAAVqJlfxsXUkx8T80abSvpVixMsCA2buv7Y0A9uZUXXlUhTlj2g1
 Wlu7ta8tgegKm8BPxHJ2x7e28sOK0kEzUNFBixmdZvGKRbbnRcv3WAYd6gEQki4zPskI364GLqR
 0jOfVz+z+/JgA/WQ=
X-Received: by 2002:a05:600c:2108:: with SMTP id
 u8mr5661262wml.183.1579805434043; 
 Thu, 23 Jan 2020 10:50:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqzKvKz/R8wGfFD98N3+Sfe78jiEWsMLIg036xVx1tQKbJpIPU5JZdO865JatfeR9D/DtxETMw==
X-Received: by 2002:a05:600c:2108:: with SMTP id
 u8mr5661247wml.183.1579805433898; 
 Thu, 23 Jan 2020 10:50:33 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id a184sm3729928wmf.29.2020.01.23.10.50.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 10:50:33 -0800 (PST)
Subject: Re: GraphViz extension on QEMU Wiki
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Jeff Cody <codyprime@gmail.com>
References: <b4291830-5edd-5f7e-6170-63e43b6e629d@redhat.com>
 <20200102150933.GP121208@stefanha-x1.localdomain>
 <2a658dcc-0004-d127-f4dc-1d380eaa1223@redhat.com>
Message-ID: <5329cf0f-be12-df52-f10f-ebf41626555e@redhat.com>
Date: Thu, 23 Jan 2020 19:50:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <2a658dcc-0004-d127-f4dc-1d380eaa1223@redhat.com>
Content-Language: en-US
X-MC-Unique: uaAofNa3MbakvhfoBhuHlw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey Jeff,

Can you have a quick look at this, at least to see if it is doable?

On 1/2/20 4:27 PM, Philippe Mathieu-Daud=E9 wrote:
> On 1/2/20 4:09 PM, Stefan Hajnoczi wrote:
>> On Thu, Dec 26, 2019 at 07:05:04PM +0100, Philippe Mathieu-Daud=E9 wrote=
:
>>> I'm not sure who is responsible of this...
>>
>> Jeff maintains the web server and wiki.
>>
>> I can look into things when Jeff is too busy, but lets see if he has
>> time in January.
>=20
> Sure no problem this is not urgent, this is to improve some=20
> documentation and add GSoC ideas.
>=20
> Thanks.


