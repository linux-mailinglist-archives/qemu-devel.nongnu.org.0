Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59757302830
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:49:42 +0100 (CET)
Received: from localhost ([::1]:42020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l453d-0004Os-DN
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:49:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l451R-00038g-Vq
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:47:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l451O-00034X-T7
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:47:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611593240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HmHQ3hGEu74dJlI/SfxJ0pz9wJuJHnxF7ETcRM1e50s=;
 b=O5A8UYtFkEQowrKfIFopDZ7yoKINj6Y4CtuovanJlZNlCKgMXgdguwq4a48QhuY9OSlUam
 9z5k+fgsyxEWbWfQaA71B92mRpmcYGlTnSHSWZWJFdSnLs4qdNW+DdTrggzt+Octn0nxE1
 Hhya94ED28StmsXgQpftqjaZqZ4csp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-0wl7hCH0NVOj68JPJmtpIA-1; Mon, 25 Jan 2021 11:47:17 -0500
X-MC-Unique: 0wl7hCH0NVOj68JPJmtpIA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46BCABBEEC;
 Mon, 25 Jan 2021 16:47:16 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F6D860C0F;
 Mon, 25 Jan 2021 16:47:15 +0000 (UTC)
Subject: Re: [PATCH v3] sphinx: adopt kernel readthedoc theme
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20210120102556.125012-1-marcandre.lureau@redhat.com>
 <26032f17-cfbc-1e86-1ca1-10661d4f5cbb@redhat.com>
 <CAJ+F1CKKh7Ap-4TE+Wtc584HEEOKaGFva5SYa9B-bBPUFwqfPg@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <7ffcb025-56ca-377d-d08b-d06b900c2fee@redhat.com>
Date: Mon, 25 Jan 2021 11:47:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CKKh7Ap-4TE+Wtc584HEEOKaGFva5SYa9B-bBPUFwqfPg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, bmeng.cn@gmail.com,
 "Daniel P. Berrange" <berrange@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/24/21 1:19 PM, Marc-André Lureau wrote:
> Hi
> 
> On Fri, Jan 22, 2021 at 12:59 AM John Snow <jsnow@redhat.com> wrote:
>>
>> On 1/20/21 5:25 AM, marcandre.lureau@redhat.com wrote:
>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>
>>> The default "alabaster" sphinx theme has a couple shortcomings:
>>> - the navbar moves along the page
>>> - the search bar is not always at the same place
>>> - it lacks some contrast and colours
>>>
>>> The "rtd" theme from readthedocs.org is a popular third party theme used
>>> notably by the kernel, with a custom style sheet. I like it better,
>>> perhaps others do too. It also simplify "Edit on Gitlab" links.
>>>
>>> Tweak a bit the custom theme to match qemu.org style, use the
>>> QEMU logo, and favicon etc.
>>>
>>> Screenshot:
>>> https://i.ibb.co/XWwG1bZ/Screenshot-2021-01-20-Welcome-to-QEMU-s-documentation-QEMU-documentation.png
>>>
>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> ---
>>>    docs/_templates/editpage.html              |   5 -
>>>    docs/conf.py                               |  47 +++---
>>>    docs/devel/_templates/editpage.html        |   5 -
>>>    docs/interop/_templates/editpage.html      |   5 -
>>>    docs/specs/_templates/editpage.html        |   5 -
>>>    docs/sphinx-static/theme_overrides.css     | 161 +++++++++++++++++++++
>>>    docs/system/_templates/editpage.html       |   5 -
>>>    docs/tools/_templates/editpage.html        |   5 -
>>>    docs/user/_templates/editpage.html         |   5 -
>>>    tests/docker/dockerfiles/debian10.docker   |   1 +
>>>    tests/docker/dockerfiles/fedora.docker     |   1 +
>>>    tests/docker/dockerfiles/ubuntu.docker     |   1 +
>>>    tests/docker/dockerfiles/ubuntu1804.docker |   1 +
>>>    tests/docker/dockerfiles/ubuntu2004.docker |   1 +
>>>    14 files changed, 193 insertions(+), 55 deletions(-)
>>>    delete mode 100644 docs/_templates/editpage.html
>>>    delete mode 100644 docs/devel/_templates/editpage.html
>>>    delete mode 100644 docs/interop/_templates/editpage.html
>>>    delete mode 100644 docs/specs/_templates/editpage.html
>>>    create mode 100644 docs/sphinx-static/theme_overrides.css
>>>    delete mode 100644 docs/system/_templates/editpage.html
>>>    delete mode 100644 docs/tools/_templates/editpage.html
>>>    delete mode 100644 docs/user/_templates/editpage.html
>>>
>>> diff --git a/docs/_templates/editpage.html b/docs/_templates/editpage.html
>>> deleted file mode 100644
>>> index 4319b0f5ac..0000000000
>>> --- a/docs/_templates/editpage.html
>>> +++ /dev/null
>>> @@ -1,5 +0,0 @@
>>> -<div id="editpage">
>>> -  <ul>
>>> -    <li><a href="https://gitlab.com/qemu-project/qemu/-/blob/master/docs/{{pagename}}.rst">Page source</a></li>
>>> -  </ul>
>>> -</div>
>>> diff --git a/docs/conf.py b/docs/conf.py
>>> index 2ee6111872..5ee577750b 100644
>>> --- a/docs/conf.py
>>> +++ b/docs/conf.py
>>> @@ -151,37 +151,44 @@ with open(os.path.join(qemu_docdir, 'defs.rst.inc')) as f:
>>>    # a list of builtin themes.
>>>    #
>>>    html_theme = 'alabaster'
>>> +try:
>>> +    import sphinx_rtd_theme
>>> +    html_theme = 'sphinx_rtd_theme'
>>> +except ImportError:
>>> +    sys.stderr.write('Warning: The Sphinx \'sphinx_rtd_theme\' HTML theme was not found. Make sure you have the theme installed to produce pretty HTML output. Falling back to the default theme.\n')
>>>
>>>    # Theme options are theme-specific and customize the look and feel of a theme
>>>    # further.  For a list of options available for each theme, see the
>>>    # documentation.
>>> -# We initialize this to empty here, so the per-manual conf.py can just
>>> -# add individual key/value entries.
>>> -html_theme_options = {
>>> -}
>>> +if html_theme == 'sphinx_rtd_theme':
>>> +    html_theme_options = {
>>> +        "style_nav_header_background": "#802400",
>>> +    }
>>> +
>>
>> This needs a default for html_theme_options so that if sphinx_rtd_theme
>> isn't present, the build doesn't break when using the fallback to
>> alabaster; I'm seeing:
>>
>> Traceback (most recent call last):
>>     File "/usr/lib/python3.8/site-packages/sphinx/config.py", line 361,
>> in eval_config_file
>>       execfile_(filename, namespace)
>>     File "/usr/lib/python3.8/site-packages/sphinx/util/pycompat.py", line
>> 81, in execfile_
>>       exec(code, _globals)
>>     File "/home/jsnow/src/qemu/docs/user/conf.py", line 15, in <module>
>>       html_theme_options['description'] = u'User Mode Emulation User''s
>> Guide'
>> NameError: name 'html_theme_options' is not defined
>>
> 
> Ok, I don't get that error with sphinx 3.2.1 on fc33...
> 

Just in case it helps you:

- FC33
- Sphinx 3.4.3
- alabaster 0.7.12
- Python 3.9.1 (3.9.1-1.fc33)

Hopefully we can just switch over to RTD theme and ignore the fallback, 
but you'll probably need to come up with a test matrix for sphinx 
versions and RTD theme versions and ensure that it works on our 
supported distro list.

Variables:
- Python versions (3.6 through 3.9)
- Sphinx versions (?? through 3.4.3)
- sphinx-rtd-theme vesrions (?? through 0.5.1)


