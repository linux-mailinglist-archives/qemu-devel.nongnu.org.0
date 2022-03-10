Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3971B4D4761
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:55:54 +0100 (CET)
Received: from localhost ([::1]:39294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIKf-0005TB-AK
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:55:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nSH9Q-00047s-NM
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:40:13 -0500
Received: from [2a00:1450:4864:20::42c] (port=41875
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nSH9P-0001eQ-0D
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:40:12 -0500
Received: by mail-wr1-x42c.google.com with SMTP id i8so7487644wrr.8
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5/I4imy6OCXOjdQ7i8ZvD4SGjU6vtinBHqhYrSNgAyk=;
 b=ni7CAKZxSPk8dKkilHOZqbhHSd+z0LWesxSVo+232zO7IJ1u/nhjcrR7nFMvlEtwJ9
 FLDr95EDiCg3wxtZGlmsHTkiRIMPSk0qgp1D+/rbEKxgfF9dFEANTUTpIQWyUMcFyaMl
 72EDv1okyuLDeZsDuOzVSMhW+FtRI3BfoQ5ZbNpFkIsOhLUAeY//2TON7p7X8fmSHo1r
 FRIf9CYDMW3m16MlxkQDnUM32joZyy2A03DGGz4Om/qpjGy2qwe/syUkIXI8LVrwtX/1
 zhB3nvBTDKsbJsNPxAGy6kA+lOwHbh7nnUwnJI2tyFWXqXclpT5eg5Rrr3yzQ+aNa+jl
 B+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5/I4imy6OCXOjdQ7i8ZvD4SGjU6vtinBHqhYrSNgAyk=;
 b=LDDgByhmhL5cIbLMaZwNBN8B7UQBUxHU0WlnKEQiHBZFFUZw6b/TVllCdsBzCO4DYa
 G8zt0G4l1zruFj5cMWqfP40vORUKKUQ3/fMU5rPgDeh7nET9V211hzAlsapGbvM6sLGR
 zIjAzqB+eYvYw3bxLjufoAurs9en60llVcGTMskpSmctzj5S1pKNHLwCp3tW5glwcZbO
 m9gsbCrwqEozrBeB7XA6SRgkWIEHyZ0TDICdv8isQ9BBad7l9WMDyByX40dRMaUBmGa7
 y2cRxbi8c1WhAgxmtqPagXA6mFra3vAliQzcgmfW9f4Y3dEpxL5ygU9155LD7S27PTZA
 DEXA==
X-Gm-Message-State: AOAM530dmriJLz8xwgkv4VIuhVqjJCC8QvnHTPfpkvkSBSFrrRPL8joX
 7gIPkJXGSkbgNYz84Pu5B+U=
X-Google-Smtp-Source: ABdhPJzfE08nSnjCSrUD68FgPliPjBeSfdLRhKACMXhGOf1IbXRU+bL/nQc0I25ioxDoJsbc9VqfuQ==
X-Received: by 2002:a5d:4cd1:0:b0:1f0:24d5:7c37 with SMTP id
 c17-20020a5d4cd1000000b001f024d57c37mr3244908wrt.421.1646912407917; 
 Thu, 10 Mar 2022 03:40:07 -0800 (PST)
Received: from [192.168.1.34] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 p11-20020adf9d8b000000b001f063deef80sm3906426wre.86.2022.03.10.03.40.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 03:40:07 -0800 (PST)
Message-ID: <b3438511-abad-b9bd-5343-7e6dacabda3c@gmail.com>
Date: Thu, 10 Mar 2022 12:40:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: MAINTAINERS: macOS host support (was: MAINTAINERS: take edk2)
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <2263450.oHEczLTUl7@silver> <YiiTEAAqRIdRAlEf@redhat.com>
 <4171087.x6ZCljQdK5@silver> <YincBMmKYK+GzPnN@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <YincBMmKYK+GzPnN@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Beraldo Leal <bleal@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Joelle van Dyne <j@getutm.app>, Cameron Esfahani <dirty@apple.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Stefan for overall project resources.

On 10/3/22 12:07, Daniel P. Berrangé wrote:
> On Thu, Mar 10, 2022 at 12:00:35PM +0100, Christian Schoenebeck wrote:
>> On Mittwoch, 9. März 2022 12:44:16 CET Daniel P. Berrangé wrote:
>>> On Wed, Mar 09, 2022 at 11:40:42AM +0100, Christian Schoenebeck wrote:
>>>> On Mittwoch, 9. März 2022 11:05:02 CET Philippe Mathieu-Daudé wrote:
>>>>> Not sure what you have in mind. I'm totally new to the macOS/Darwin
>>>>> world, and have no choice but to use it as primary workstation and
>>>>> for CI builds, so I can help with overall testing / maintenance.
>>>>>
>>>>> Peter, since you take some macOS patches, would you like to maintain
>>>>> this officially? Since I doubt you want to take yet another
>>>>> responsibility, what about having a co-maintained section, including
>>>>> technical expertise from Akihiko / Joelle / Christian? (Cc'ed)
>>>>>
>>>>> Regards,
>>>>
>>>> Also CCing Cameron on this, just in case someone at Apple could spend some
>>>> slices on QEMU macOS patches in general as well.
>>>>
>>>> As for my part: I try to help out more on the macOS front. As there's now
>>>> macOS host support for 9p I have to start QEMU testing on macOS locally
>>>> anyway. Too bad that macOS CI tests on Github are no longer available BTW.
>>>
>>> Note QEMU gets macOS CI coverage in GitLab. We use a clever trick by
>>> which we use 'cirrus-run' from the GitLab job to trigger a build in
>>> Cirrus CI's macOS builders, and pull the results back when its done.
>>>
>>> Any contributor can get this working on their QEMU fork too, if they
>>> configure the needed Cirrus CI API token. See the docs in
>>>
>>>     .gitlab-ci.d/cirrus/README.rst
>>>
>>> This is enough for build + automated tests.
>>
>> Does this mean that people no longer have to pull their credit card just for
>> running CI tests on Gitlab?
> 
> Not really. The CC validation is something GitLab have had to force
> onto all new accounts due to cryptominer abuse of their free shared
> CI runners :-( If you have VMs somewhere you could theoretically
> spin up your own CI runners instead of using the shared runners and
> that could avoid the CC validation need.

Not that trivial, first you need to figure out the list of dependencies
GitLab images come with, then you realize you need 50GiB+ of available
storage a single pipeline (due to all the Docker images pulled / built)
and you also need a decent internet link otherwise various jobs timeout
randomly, then you have to wait 20h+ with a quad-core CPU / 16GiB RAM,
and eventually you realize you lost 3 days of your life to not register
your CC which you'll be forced to give anyway.

Long term maintainers don't realize that because they had the luxury to
open their GitLab account soon enough and are now privileged.

It is unfortunate the project strongly suggest new maintainers to pass
by that hassle and doesn't provide access to project resources instead.

But then I know, while the project has access to FOSS hardware resources
it doesn't have human resources to maintain them so can't use them, back
to square one.

Regards,

Phil.

